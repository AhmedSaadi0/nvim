local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

-- lspconfig.pyright.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	settings = {
-- 		python = {
-- 			analysis = {
-- 				-- typeCheckingMode = "off",
-- 				-- Add the following lines for Django-specific type checking
-- 				extraPaths = { "/media/linux/projects/hopofy/stable/" },
-- 				useLibraryCodeForTypes = true,
-- 			},
-- 		},
-- 	},
-- 	filetypes = { "python" },
-- })

lspconfig.pyright.setup({
	on_attach = on_attach,
	-- this is qrong text
	capabilities = capabilities,
	filetypes = { "python" },
})
