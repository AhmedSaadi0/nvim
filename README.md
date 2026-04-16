# starter

My nvim config

## Needed apps

- fzf
- ripgrep

## Install needed apps

### Fedora 41

```bash
sudo dnf install fzf ripgrep fd-find
pip install --user 'python-lsp-server[all]' isort
```

### AI

#### Bridge

```
Flask>=3.0.0
requests>=2.31.0
```

```bash
python ~/.config/nvim/ai/bridge.py --api-key "1c2....qh6X" --provider "ollama" --model "qwen3-coder:480b-cloud"
```

#### Installation Steps

1. **Copy opencode.json to ~/.config/opencode/config.json**

```bash
mkdir -p ~/.config/opencode
cp ~/.config/nvim/opencode/opencode.json ~/.config/opencode/config.json
```

2. **Start the bridge server**
   ```bash
   python ~/.config/nvim/ai/bridge.py --api-key "YOUR_API_KEY" --provider "ollama" --model "qwen3-coder:480b-cloud"
   ```

3. **Configure Neovim** (if needed)
   - The bridge runs on `http://localhost:5000`
   - opencode.json is already configured to connect to the bridge

#### Code Explanation

**bridge.py** is a transparent proxy that:
- Receives requests from Neovim via `/v1/chat/completions`
- Forwards them to the cloud provider (Ollama.com/OpenRouter)
- Streams responses back to Neovim
- Logs all requests for debugging

**Key features:**
- No modifications to incoming requests (except model name)
- Raw byte stream forwarding for minimal latency
- Proper error handling with SSE format
- Timeout handling (120 seconds)

**opencode.json** configuration:
- `server_bridge_agent`: Connects to the local bridge server
- `baseURL`: Points to `http://localhost:5000/v1`
- `custom-model`: The model name used by the bridge
- Supports 128K context and 65K output tokens
