# My Neovim Configuration

A modern, highly customizable Neovim setup built around the NvChad framework with AI integration, Python/Django development focus, and extensive LSP support.

![Neovim](https://img.shields.io/badge/Neovim-57a143?logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-2C2D72?logo=lua&logoColor=white)

## ✨ Features

- 🎨 Modern UI with NvChad base46 theming
- 🤖 AI Integration with OpenCode & Avante (Ollama.com bridge)
- 🐍 Python/Django development optimized
- 🦀 LSP support for Lua, Python, TypeScript, HTML, CSS, GraphQL, and more
- 🛠 Code formatting with Conform.nvim (Black, Prettier, Stylua, etc.)
- 🔍 FZF-powered file navigation
- 📝 Treesitter-powered syntax highlighting
- 🎮 Vim-motion style keybindings
- 🌐 Git integration with Gitsigns.nvim

## 📋 Prerequisites

- Neovim >= 0.9.0
- git (for cloning and version control)
- Python 3.x (for LSP and plugins)
- Node.js & npm (for some LSP servers)
- lazygit (for Git visualization)

## 🔧 Installation

### Prerequisites

Install required system packages:

#### Fedora/RHEL

```bash
sudo dnf install git nodejs npm python3 python3-pip fzf ripgrep fd-find lazygit
```

#### Ubuntu/Debian

```bash
sudo apt install git nodejs npm python3 python3-pip fzf ripgrep fd-find lazygit
```

## 📦 Plug-ins Included

### Core Plugins

| Plugin                                              | Description                                          |
| --------------------------------------------------- | ---------------------------------------------------- |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Modern UI components (dashboard, explorer, notifier) |
| [base46](https://github.com/nvchad/base46)          | Theme engine with catppuccin and custom themes       |
| [nui.nvim](https://github.com/MunifTanjim/nui.nvim) | UI components for floating windows                   |
| [lazy.nvim](https://github.com/folke/lazy.nvim)     | Plugin manager                                       |

### AI & Coding Assistants

| Plugin                                                         | Description                                |
| -------------------------------------------------------------- | ------------------------------------------ |
| [opencode.nvim](https://github.com/nickjvandyke/opencode.nvim) | AI coding assistant with LSP integration   |
| [avante.nvim](https://github.com/yetone/avante.nvim)           | AI coding assistant focused on refactoring |

### LSP & Language Support

| Language              | LSP Server      | Formatter               |
| --------------------- | --------------- | ----------------------- |
| Python                | Pyright + Pylsp | Black, isort, autoflake |
| Lua                   | LuaLS           | Stylua                  |
| JavaScript/TypeScript | TSServer        | Prettier                |
| HTML/CSS              | HTML/CSS LSP    | Prettier                |
| GraphQL               | GraphQL LSP     | Prettier                |
| Django Templates      | DJLint          | DJLint                  |
| QML                   | QML LSP         | clang-format            |

### Git & Navigation

| Plugin                                                          | Description                    |
| --------------------------------------------------------------- | ------------------------------ |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)     | Git integration in sign column |
| [lazygit](https://github.com/jesseduffield/lazygit)             | Git visualization and management |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua)                  | Fast file search with FZF      |
| [persistent.nvim](https://github.com/renerh77/persistence.nvim) | Session management             |

### Utility Plugins

| Plugin                                                                | Description          |
| --------------------------------------------------------------------- | -------------------- |
| [comment.nvim](https://github.com/numToStr/Comment.nvim)              | Smart commenting     |
| [conform.nvim](https://github.com/stevearc/conform.nvim)              | Code formatting      |
| [nvim-surround](https://github.com/kylechui/nvim-surround)            | Surround pairs       |
| [nvim-autopairs](https://github.com/konfekt/nvim-autopairs)           | Auto parentheses     |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)     | Highlight TODO/FIXME |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting  |

## ⌨️ Keybindings

### Leader Key: `Space`

#### General

- `;` - Enter command mode
- `<leader>ox` - Open OpenCode action menu
- `<leader>ot` - Toggle OpenCode UI

#### OpenCode (AI Assistant)

- `<leader>oa` - Ask about current selection
- `go` - Add range to OpenCode
- `goo` - Add line to OpenCode
- `<S-C-u>` / `<S-C-d>` - Scroll up/down
- `<leader>og` / `<leader>oG` - Go to first/last message
- `<leader>oi` - Interrupt OpenCode
- `<leader>on` - New session
- `<leader>os` - Select session
- `<leader>ol` - List sessions
- `<leader>oc` - Compact session

#### Git

- `<leader>gs` - Stage hunk
- `<leader>gr` - Reset hunk
- `<leader>gS` - Stage entire file
- `<leader>gp` - Preview hunk
- `<leader>gb` - Show blame for line
- `<leader>gd` / `<leader>gD` - Show diff
- `[c` / `]c` - Next/previous hunk

#### Navigation

- `<C-n>` / `<C-p>` - Next/previous window
- `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` - Window navigation

## 🤖 AI Integration

### Bridge Setup (Ollama.com)

This config includes a transparent proxy bridge for connecting to Ollama.com:

```bash
# Install Python dependencies
pip install flask requests

# Start the bridge server
cd ~/.config/nvim
python ai/bridge.py --api-key "YOUR_API_KEY" --provider "ollama" --model "qwen3-coder:480b-cloud"
```

**Note**: The bridge runs on `http://localhost:5000` and forwards requests to Ollama.com.

### OpenCode Configuration

Copy `opencode/opencode.json` to `~/.config/opencode/config.json`:

```bash
mkdir -p ~/.config/opencode
cp ~/.config/nvim/opencode/opencode.json ~/.config/opencode/config.json
```

### Avante Configuration

Avante is configured to use the bridge server at `http://localhost:5000` with the `server_bridge_agent` provider.

## 👨‍💻 Development Setup

### Django Projects

The config automatically detects Django projects (checks for `manage.py`) and disables strict type checking in pyright.

### Python Development

- Uses `pyright` for language server
- Auto-install formatters via Mason: Black, isort, autoflake
- Automatic import sorting with isort
- Unused import removal with autoflake

### Lua Development

- LuaLS configured with Neovim API
- Strict type checking disabled by default
- Snippet support enabled

## 🎨 Custom Themes

Built-in custom themes (based on base46):

- `a-midnight_forest`
- `a-eclipse`
- `a-cosmic`
- `a-magma`
- `a-deep_ocean`
- `a-cherry`
- `a-mirage`
- `a-quiet_storm`
- `a-chocolate`

## 📝 Configuration Files

```
~/.config/nvim/
├── lua/
│   ├── config/
│   │   ├── mappings/      # Keybindings
│   │   └── options.lua    # Neovim options
│   ├── plugins/           # Plugin configurations
│   │   ├── lsp-configs/   # LSP server configs
│   │   └── snacks-configs/ # Snacks.nvim configs
│   ├── themes/            # Custom themes
│   └── snippets/          # Snippet definitions
├── ai/
│   └── bridge.py          # Proxy bridge for AI providers
├── opencode/
│   └── opencode.json      # OpenCode configuration
└── init.lua               # Main entry point
```

## 🐛 Troubleshooting

### Plugins not loading

```bash
:Lazy sync
```

### LSP not starting

```bash
:Mason
# Check logs: :LspInfo
```

### Bridge not working

1. Ensure Python dependencies are installed: `pip install flask requests`
2. Check if the bridge is running: `curl http://localhost:5000/v1/chat/completions`
3. Verify API key is correct in the bridge command

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch: `git checkout -b feature/AmazingFeature`
3. Commit your changes: `git commit -m 'Add some AmazingFeature'`
4. Push to the branch: `git push origin feature/AmazingFeature`
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 💪 Acknowledgments

- [NvChad](https://github.com/NvChad/NvChad) for the base configuration
- All the plugin authors for their amazing work
- The Neovim community for continuous support

---

_Last updated: April 2026_
