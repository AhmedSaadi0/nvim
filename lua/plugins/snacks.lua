return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = {
			enabled = true,
			notify = false,
			size = 1024 * 1024,
			line_length = 1200,
			setup = function(ctx)
				if vim.fn.exists(":NoMatchParen") ~= 0 then
					vim.cmd([[NoMatchParen]])
				end
				Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
				vim.b.completion = false
				vim.b.minianimate_disable = true
				vim.b.minihipatterns_disable = true
				vim.b.snacks_words = false
				vim.b.snacks_scroll = false
				local ok, ibl = pcall(require, "ibl")
				if ok then
					ibl.setup_buffer(ctx.buf, { enabled = false })
				end
				vim.schedule(function()
					if vim.api.nvim_buf_is_valid(ctx.buf) then
						vim.bo[ctx.buf].syntax = ctx.ft
					end
				end)
			end,
		},
		dashboard = { enabled = true },
		input = {
			enabled = true,
			win = {
				style = "input",
				width = 60,
				row = 2,
			},
		},
		notifier = {
			enabled = true,
			timeout = 2500,
			level = vim.log.levels.INFO,
			style = "compact",
			margin = { top = 1, right = 1, bottom = 1 },
			keep = function()
				return vim.fn.getcmdpos() > 0
			end,
			top_down = false,
		},
		quickfile = { enabled = true, exclude = { "latex" } },
		scroll = {
			enabled = true,
			animate = {
				duration = { step = 8, total = 120 },
				easing = "linear",
			},
			animate_repeat = {
				delay = 120,
				duration = { step = 4, total = 40 },
				easing = "linear",
			},
			filter = function(buf)
				if vim.g.snacks_scroll == false or vim.b[buf].snacks_scroll == false then
					return false
				end
				if vim.bo[buf].buftype ~= "" or vim.bo[buf].filetype == "bigfile" then
					return false
				end
				return true
			end,
		},
		statuscolumn = {
			enabled = true,
			folds = { open = true, git_hl = true },
		},
		words = {
			enabled = true,
			debounce = 300,
			notify_end = false,
			modes = { "n" },
			filter = function(buf)
				if vim.g.snacks_words == false or vim.b[buf].snacks_words == false then
					return false
				end
				if vim.bo[buf].buftype ~= "" or vim.bo[buf].filetype == "bigfile" then
					return false
				end
				return true
			end,
		},
		-- Handled by dedicated plugins
		indent = { enabled = false },
		scope = { enabled = false },
		picker = { enabled = false },
	},
}
