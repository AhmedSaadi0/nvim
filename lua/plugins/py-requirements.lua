return {
	"MeanderingProgrammer/py-requirements.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("py-requirements").setup({
			-- Enabled by default if you want to disable lsp completions set to false
			enable_lsp = true,
			-- Disabled by default if you want to use `nvim-cmp` source set to true
			enable_cmp = true,
			-- Endpoint used for getting package versions
			index_url = "https://pypi.org/simple/",
			-- Fallback endpoint in case 'index_url' fails to find a package
			extra_index_url = nil,
			-- Specify which file patterns plugin is active on
			-- For info on patterns, see :h pattern
			file_patterns = { "requirements.txt", "requirements-3.13.txt" },

			-- Options for how diagnostics are displayed
			diagnostic_opts = { padding = 5 },
			-- For available options, see :h vim.lsp.util.open_floating_preview
			float_opts = { border = "rounded" },
			filter = {
				-- If set to true pull only final release versions, this will ignore alpha,
				-- beta, release candidate, post release, and developmental release versions
				final_release = false,
				-- If set to true (default value) filter out yanked package versions
				yanked = true,
			},
			-- Query to get each dependency present in a file
			requirement_query = "(requirement) @requirement",
			-- Query to get information out of each dependency
			dependency_query = [[
                (requirement (package) @name)
                (version_spec (version_cmp) @cmp)
                (version_spec (version) @version)
            ]],
		})

		-- Register the requirements parser with nvim-treesitter
		-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		-- parser_config.requirements = {
		-- 	install_info = {
		-- 		url = "https://github.com/tree-sitter-grammars/tree-sitter-requirements",
		-- 		files = { "src/parser.c" },
		-- 		branch = "main",
		-- 	},
		-- 	filetype = "requirements",
		-- }
	end,
}
