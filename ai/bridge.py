import argparse
import logging
import sys
import time

import requests
from flask import Flask, Response, request

# إعدادات اللوق (سيكتب في التيرمينال فقط ليخبرك بمرور الطلبات)
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - ⚡ %(message)s",
    handlers=[logging.StreamHandler(sys.stdout)],
)
logger = logging.getLogger("PURE_BRIDGE")

app = Flask(__name__)

PROVIDERS = {
    "ollama": {
        "endpoint": "https://ollama.com",
        "path": "/v1/chat/completions",
    },
    "openrouter": {
        "endpoint": "https://openrouter.ai",
        "path": "/api/v1/chat/completions",
    },
}

parser = argparse.ArgumentParser(description="Pure Transparent Bridge")
parser.add_argument("--api-key", required=True)
parser.add_argument(
    "--provider", required=True, choices=list(PROVIDERS.keys())
)
parser.add_argument("--model", default="qwen3-coder:480b-cloud")
parser.add_argument("--port", type=int, default=5000)
args = parser.parse_args()

provider_config = PROVIDERS[args.provider]
target_url = f"{provider_config['endpoint']}{provider_config['path']}"


@app.route("/v1/chat/completions", methods=["POST"])
@app.route("/v1/messages", methods=["POST"])
@app.route("/v1/responses", methods=["POST"])
def proxy():
    logger.info("=" * 50)
    logger.info("📥 RECEIVED REQUEST")

    # 1. أخذ الطلب من الإضافة كما هو تماماً بدون أي فحص أو تعديل
    if not request.json:
        logger.error("❌ INVALID REQUEST: Missing JSON body")
        return Response(
            'data: {"error": "Invalid request body"}\n\n'.encode("utf-8"),
            mimetype="text/event-stream",
        )

    payload = request.json
    payload["model"] = args.model
    # logger.info(f"📥 REQUEST PAYLOAD: {payload}")

    # 2. تجهيز الهيدر للسيرفر السحابي
    # مرر كل هيدرات العميل كما هي مع إضافة Authorization فقط
    headers = {}
    # for key, value in request.headers.items():
    #     if key.lower() not in ["host", "content-length"]:
    #         headers[key] = value
    headers["Authorization"] = f"Bearer {args.api_key}"
    headers["Content-Type"] = "application/json"

    # استخدام المسار القياسي بناءً على المزود
    logger.info(f"🚀 FORWARDING PURE REQUEST TO: {target_url}")

    def generate():
        max_retries = 3
        retry_delay = 2

        for attempt in range(max_retries):
            try:
                logger.info(f"🚀 ATTEMPT {attempt + 1}/{max_retries}")

                response = requests.post(
                    target_url,
                    headers=headers,
                    json=payload,
                    stream=True,
                )

                if response.status_code == 429:
                    if attempt < max_retries - 1:
                        logger.warning(f"⚠️ RATE LIMIT (429) - RETRYING in {retry_delay}s")
                        time.sleep(retry_delay)
                        retry_delay *= 2
                        continue
                    else:
                        error_msg = response.json().get("error", {}).get("message", "Rate limit exceeded")
                        logger.error(f"❌ RATE LIMIT AFTER {max_retries} ATTEMPTS")
                        yield f'data: {{"error": {{"message": "{error_msg}", "code": 429}}}}\n\n'.encode("utf-8")
                        yield b"data: [DONE]\n\n"
                        return

                if response.status_code != 200:
                    error_data = response.json()
                    error_msg = error_data.get("error", {}).get("message", f"API error: {response.status_code}")
                    logger.error(f"❌ API ERROR: {response.status_code}")
                    yield f'data: {{"error": {{"message": "{error_msg}", "code": {response.status_code}}}}}\n\n'.encode("utf-8")
                    yield b"data: [DONE]\n\n"
                    return

                for chunk in response.iter_content(chunk_size=4096):
                    if chunk:
                        yield chunk

                logger.info("📤 SENDING [DONE]")
                yield b"data: [DONE]\n\n"
                logger.info("✅ STREAM FINISHED SUCCESSFULLY")
                return

            except Exception as e:
                if attempt < max_retries - 1:
                    logger.warning(f"⚠️ ERROR: {str(e)} - RETRYING in {retry_delay}s")
                    time.sleep(retry_delay)
                    retry_delay *= 2
                    continue
                logger.error(f"❌ PROXY ERROR AFTER {max_retries} ATTEMPTS: {str(e)}")
                yield f'data: {{"error": {{"message": "{str(e)}", "type": "proxy_error"}}}}\n\n'.encode("utf-8")
                yield b"data: [DONE]\n\n"
                return

    return Response(generate(), mimetype="text/event-stream")


if __name__ == "__main__":
    app.run(port=args.port)
