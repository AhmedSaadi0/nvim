import argparse
import logging
import sys

import requests
from flask import Flask, Response, request

# إعدادات اللوق (سيكتب في التيرمنال فقط ليخبرك بمرور الطلبات)
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - ⚡ %(message)s",
    handlers=[logging.StreamHandler(sys.stdout)],
)
logger = logging.getLogger("PURE_BRIDGE")

app = Flask(__name__)

parser = argparse.ArgumentParser(description="Pure Transparent Bridge")
parser.add_argument("--api-key", required=True)
parser.add_argument("--endpoint", default="https://ollama.com")
parser.add_argument("--model", default="qwen3-coder:480b-cloud")
parser.add_argument("--port", type=int, default=5000)
args = parser.parse_args()


@app.route("/v1/chat/completions", methods=["POST"])
def proxy():
    logger.info("=" * 50)
    logger.info("📥 RECEIVED REQUEST FROM AVANTE")

    # 1. أخذ الطلب من الإضافة كما هو تماماً بدون أي فحص أو تعديل
    payload = request.json
    payload["model"] = args.model  # فقط نتأكد أن المودل هو المطلوب

    # 2. تجهيز الهيدر للسيرفر السحابي
    headers = {
        "Authorization": f"Bearer {args.api_key}",
        "Content-Type": "application/json",
    }

    # استخدام المسار القياسي /v1/chat/completions الذي يدعمه Ollama natively
    target_url = f"{args.endpoint.rstrip('/')}/v1/chat/completions"
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

            # 4. تمرير البيانات (Bytes) الخام مباشرة إلى Neovim كما هي!
            for chunk in response.iter_content(chunk_size=4096):
                if chunk:
                    yield chunk

            logger.info("✅ STREAM FINISHED SUCCESSFULLY")

        except Exception as e:
            logger.error(f"❌ PROXY ERROR: {str(e)}")
            # إرجاع الخطأ بصيغة البايتات لكي لا ينهار Neovim
            yield f'data: {{"error": "{str(e)}"}}\n\n'.encode("utf-8")
            yield b"data:[DONE]\n\n"

    return Response(generate(), mimetype="text/event-stream")


if __name__ == "__main__":
    app.run(port=args.port)
