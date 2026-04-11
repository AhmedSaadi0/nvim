import argparse
import json
import logging
import re

import requests
from flask import Flask, Response, request

logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(message)s")
logger = logging.getLogger("AI_DEBUG")

app = Flask(__name__)

parser = argparse.ArgumentParser(
    description="Avante Python Bridge - Stable Mode v2"
)
parser.add_argument("--api-key", required=True)
parser.add_argument("--endpoint", default="https://ollama.com")
parser.add_argument("--model", default="qwen3-coder:480b-cloud")
parser.add_argument("--port", type=int, default=5000)
args = parser.parse_args()

# 🔒 الأدوات المسموحة
ALLOWED_TOOLS = {"str_replace", "attempt_completion"}

# 🚫 الأدوات الممنوعة
BLOCKED_TOOLS = {"think", "read_todos", "write_todos"}


@app.route("/v1/chat/completions", methods=["POST"])
def proxy():
    data = request.json
    cleaned_messages = []

    logger.info("=" * 50)
    logger.info("RECEIVED REQUEST FROM NEOVIM")
    logger.info(f"Model: {args.model}")

    for msg in data.get("messages", []):
        content = msg.get("content", "")
        if isinstance(content, list):
            content = " ".join(
                [p.get("text", "") for p in content if p.get("type") == "text"]
            )

        if content and str(content).strip():
            cleaned_messages.append({"role": msg["role"], "content": content})

    logger.info(f"Messages count: {len(cleaned_messages)}")

    if cleaned_messages:
        logger.info(
            f"Last User Message: {cleaned_messages[-1]['content'][:100]}..."
        )

    payload = {
        "model": args.model,
        "messages": cleaned_messages,
        "stream": True,
        "options": {"temperature": 0.1},
    }

    # 🔒 فلترة الأدوات
    if "tools" in data:
        payload["tools"] = [
            t for t in data["tools"] if t["function"]["name"] in ALLOWED_TOOLS
        ]

    headers = {
        "Authorization": f"Bearer {args.api_key}",
        "Content-Type": "application/json",
    }

    def generate():
        edit_done = False  # تتبع هل حصل تعديل
        full_response_text = ""

        try:
            target_url = f"{args.endpoint.rstrip('/')}/api/chat"
            logger.info(f"CONNECTING TO CLOUD API: {target_url}")

            response = requests.post(
                target_url,
                headers=headers,
                json=payload,
                stream=True,
            )

            for line in response.iter_lines():
                if not line:
                    continue

                raw_chunk = line.decode("utf-8")
                chunk = json.loads(raw_chunk)

                message = chunk.get("message", {})
                content = message.get("content", "")
                raw_tool_calls = message.get("tool_calls", None)

                # ✂️ حذف thinking
                if content:
                    full_response_text += content
                    content = re.sub(
                        r"<thinking>.*?</thinking>",
                        "",
                        content,
                        flags=re.DOTALL,
                    )

                if content and content.strip():
                    yield f"data: {json.dumps({'choices': [{'delta': {'content': content}, 'finish_reason': None}]})}\n\n"

                # 🧠 التعامل مع الأدوات
                if raw_tool_calls:
                    tool_names = [
                        t["function"]["name"] for t in raw_tool_calls
                    ]
                    logger.info(f"!!! MODEL CALLED TOOLS: {tool_names}")

                    if "str_replace" in tool_names:
                        edit_done = True

                    formatted_tool_calls = []

                    for i, tc in enumerate(raw_tool_calls):
                        name = tc["function"]["name"]

                        # 🚫 منع الأدوات الغير مفيدة فقط
                        if name in BLOCKED_TOOLS:
                            logger.warning(f"BLOCKED TOOL: {name}")
                            continue

                        formatted_tool_calls.append(
                            {
                                "index": i,
                                "id": f"call_{i}_{args.model}",
                                "type": "function",
                                "function": {
                                    "name": name,
                                    "arguments": json.dumps(
                                        tc["function"]["arguments"]
                                    ),
                                },
                            }
                        )

                    if formatted_tool_calls:
                        yield f"data: {json.dumps({'choices': [{'delta': {'tool_calls': formatted_tool_calls}, 'finish_reason': 'tool_calls'}]})}\n\n"

                # ✅ نهاية الستريم
                if chunk.get("done"):
                    logger.info("--- CLOUD STREAM FINISHED ---")

                    # 🚨 إذا عدل ولم ينهي → أجبره ينهي
                    if edit_done:
                        logger.warning("FORCING attempt_completion")
                        result_text = (
                            full_response_text[-500:]
                            if full_response_text
                            else "Code updated"
                        )

                        yield f"data: {json.dumps({'choices': [{'delta': {'tool_calls': [{
                            'index': 0,
                            'id': f'force_{args.model}',
                            'type': 'function',
                            'function': {
                                'name': 'attempt_completion',
                                'arguments': result_text
                            }
                        }]}, 'finish_reason': 'tool_calls'}]})}\n\n"

                    yield "data: [DONE]\n\n"

        except Exception as e:
            logger.error(f"STREAM ERROR: {str(e)}")
            yield f"data: {json.dumps({'error': str(e)})}\n\n"
            yield "data: [DONE]\n\n"

    return Response(generate(), mimetype="text/event-stream")


if __name__ == "__main__":
    app.run(port=args.port)
