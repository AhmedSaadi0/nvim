import argparse
import logging
import sys

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
parser.add_argument("--provider", required=True, choices=list(PROVIDERS.keys()))
parser.add_argument("--model", default="qwen3-coder:480b-cloud")
parser.add_argument("--port", type=int, default=5000)
args = parser.parse_args()

provider_config = PROVIDERS[args.provider]
target_url = f"{provider_config['endpoint']}{provider_config['path']}"


@app.route("/v1/chat/completions", methods=["POST"])
def proxy():
    logger.info("=" * 50)
    logger.info("📥 RECEIVED REQUEST FROM AVANTE")

    # 1. أخذ الطلب من الإضافة كما هو تماماً بدون أي فحص أو تعديل
    if not request.json:
        logger.error("❌ INVALID REQUEST: Missing JSON body")
        return Response("data: {\"error\": \"Invalid request body\"}\n\n".encode("utf-8"), mimetype="text/event-stream")

    payload = request.json
    payload["model"] = args.model  # فقط نتأكد أن المودل هو المطلوب

    # 2. تجهيز الهيدر للسيرفر السحابي
    headers = {
        "Authorization": f"Bearer {args.api_key}",
        "Content-Type": "application/json",
    }

    # استخدام المسار القياسي بناءً على المزود
    logger.info(f"🚀 FORWARDING PURE REQUEST TO: {target_url}")

    def generate():
        try:
            # 3. إرسال الطلب للسيرفر السحابي
            response = requests.post(
                target_url,
                headers=headers,
                json=payload,
                stream=True,
                timeout=120,
            )

            # التحقق من حالة الاستجابة
            if response.status_code != 200:
                logger.error(f"❌ API ERROR: Status {response.status_code}")
                yield f'data: {{"error": "API error: {response.status_code}"}}\n\n'.encode("utf-8")
                yield b"data: [DONE]\n\n"
                return

            # 4. تمرير البيانات (Bytes) الخام مباشرة إلى Neovim كما هي!
            for chunk in response.iter_content(chunk_size=4096):
                if chunk:
                    yield chunk

            logger.info("✅ STREAM FINISHED SUCCESSFULLY")

        except Exception as e:
            logger.error(f"❌ PROXY ERROR: {str(e)}")
            # إرجاع الخطأ بصيغة البايتات لكي لا ينهار Neovim
            yield f'data: {{"error": "{str(e)}"}}\n\n'.encode("utf-8")
            yield b"data: [DONE]\n\n"

    return Response(generate(), mimetype="text/event-stream")


if __name__ == "__main__":
    app.run(port=args.port)
