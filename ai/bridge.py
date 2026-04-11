import argparse
import json
import re

import requests
from flask import Flask, Response, request

app = Flask(__name__)

parser = argparse.ArgumentParser(
    description="Avante Python Bridge - Fix Tool Calls"
)
parser.add_argument("--api-key", required=True)
parser.add_argument("--endpoint", default="https://ollama.com")
parser.add_argument("--model", default="glm-5.1:cloud")
parser.add_argument("--port", type=int, default=5000)
args = parser.parse_args()


@app.route("/v1/chat/completions", methods=["POST"])
def proxy():
    data = request.json
    cleaned_messages = []

    for msg in data.get("messages", []):
        content = msg.get("content", "")
        if isinstance(content, list):
            content = " ".join(
                [p.get("text", "") for p in content if p.get("type") == "text"]
            )
        if content and str(content).strip():
            cleaned_messages.append({"role": msg["role"], "content": content})

    payload = {
        "model": args.model,
        "messages": cleaned_messages,
        "stream": True,
        "options": {"temperature": 0.1},
    }

    if "tools" in data:
        payload["tools"] = data["tools"]

    headers = {
        "Authorization": f"Bearer {args.api_key}",
        "Content-Type": "application/json",
    }

    def generate():
        try:
            target_url = f"{args.endpoint.rstrip('/')}/api/chat"
            response = requests.post(
                target_url, headers=headers, json=payload, stream=True
            )

            for line in response.iter_lines():
                if line:
                    chunk = json.loads(line.decode("utf-8"))
                    message = chunk.get("message", {})
                    content = message.get("content", "")
                    raw_tool_calls = message.get("tool_calls", None)

                    # تنظيف وسم التفكير
                    if content:
                        content = re.sub(
                            r"<thinking>.*?</thinking>",
                            "",
                            content,
                            flags=re.DOTALL,
                        )

                    # 1. إرسال النص أولاً (إذا وجد)
                    if content and content.strip():
                        text_chunk = {
                            "choices": [
                                {
                                    "delta": {"content": content},
                                    "finish_reason": None,
                                }
                            ]
                        }
                        yield f"data: {json.dumps(text_chunk)}\n\n"

                    # 2. إرسال الأدوات في حزمة منفصلة (هذا ما تتوقعه Neovim/Avante)
                    if raw_tool_calls:
                        formatted_tool_calls = []
                        for i, tc in enumerate(raw_tool_calls):
                            formatted_tool_calls.append(
                                {
                                    "index": i,
                                    "id": f"call_{i}_{args.model}",
                                    "type": "function",
                                    "function": {
                                        "name": tc["function"]["name"],
                                        "arguments": json.dumps(
                                            tc["function"]["arguments"]
                                        ),
                                    },
                                }
                            )

                        tool_chunk = {
                            "choices": [
                                {
                                    "delta": {
                                        "tool_calls": formatted_tool_calls
                                    },
                                    "finish_reason": "tool_calls",
                                }
                            ]
                        }
                        yield f"data: {json.dumps(tool_chunk)}\n\n"

                    # 3. إنهاء الاتصال
                    if chunk.get("done"):
                        yield "data: [DONE]\n\n"

        except Exception as e:
            yield f"data: {json.dumps({'error': str(e)})}\n\n"
            yield "data: [DONE]\n\n"

    return Response(generate(), mimetype="text/event-stream")


if __name__ == "__main__":
    app.run(port=args.port)
