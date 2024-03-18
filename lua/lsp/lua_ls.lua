
-- ~/.config/nvim/init.lua

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
    cmd = { "lua-language-server" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT", -- or "Lua 5.1", "Lua 5.2", etc.
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                globals = { "vim" }, -- Add any global variables you use
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        },
    },
})

