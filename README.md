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
python ~/.config/nvim/ai/bridge.py --api-key "1c2....qh6X" --endpoint "https://ollama.com" --model "qwen3-coder:480b-cloud"
```
