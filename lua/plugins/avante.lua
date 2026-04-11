return {
	"yetone/avante.nvim",
	build = "make",
	event = "VeryLazy",
	version = false,
	init = function()
		-- هذه الخطوة "السحرية" تمنع الإضافة من الانهيار
		-- نضع مفتاح وهمي في ذاكرة المحرر لكي لا تطلبه الإضافة وتتسبب بخطأ
		vim.env.OPENAI_API_KEY = "sk-local-dummy-key"
	end,
	opts = {
		provider = "llamacpp",
		providers = {
			llamacpp = {
				__inherited_from = "openai",
				endpoint = "http://127.0.0.1:8080/v1",
				model = "qwen",
				api_key = "sk-local-key",
				timeout = 60000,
				disable_tools = true,
				extra_request_body = { temperature = 0.1, max_tokens = 4096 },
			},
			server_bridge = {
				__inherited_from = "openai",
				endpoint = "http://localhost:5000/v1",
				-- system_prompt = "You are an expert Django developer. YOUR TASK IS TO REFLECT AND EDIT. Do not perform recursive planning. Do not search for TODOs. If the user asks to clean code, analyze the code immediately and use the 'str_replace' tool to apply changes in one shot. DO NOT OUTPUT INTERNAL THOUGHTS. Focus on code quality and clean code principles.",
				system_prompt = [[
You are an expert Django developer.

STRICT RULES:
- DO NOT think step by step
- DO NOT repeat analysis
- DO NOT explain multiple times
- You MUST directly edit code using str_replace
- AFTER editing, you MUST immediately call attempt_completion
- NEVER continue after editing
]],
				model = "qwen3-480b",
				timeout = 120000,
				disable_tools = false,
				-- extra_request_body = {
				-- 	temperature = 0.1,
				-- 	max_tokens = 5000000,
				-- },
			},
		},
		-- openai = {
		-- 	endpoint = "http://127.0.0.1:8080/v1",
		-- 	model = "qwen", -- السيرفر المحلي لا يهتم بالاسم
		-- 	timeout = 60000,
		-- 	extra_request_body = {
		-- 		temperature = 0.1,
		-- 		max_tokens = 4096,
		-- 	},
		-- },
		behaviour = {
			auto_suggestions = false,
			auto_apply_diff_after_generation = true,
			support_paste_from_clipboard = true,
		},
		file_selector = {
			provider = "fzf",
		},
		windows = {
			position = "right", -- مكان النافذة (right, left, top, bottom)
			wrap = true, -- التفاف النص الطويل
			width = 45,
			sidebar_header = {
				align = "center", -- محاذاة عنوان النافذة (center, left)
				rounded = true, -- حواف دائرية للعنوان
			},
			input = {
				prefix = "❯ ", -- الرمز الذي يظهر قبل كتابة سؤالك
				height = 5, -- ارتفاع مربع إدخال النص
			},
			edit = {
				border = "rounded", -- نوع حواف نافذة التعديل (rounded, single, solid)
				start_insert = true, -- الدخول في وضع الإدخال فوراً
			},
			ask = {
				floating = false, -- هل تريدها نافذة عائمة بدلاً من شريط جانبي؟
				start_insert = true,
				border = "rounded",
			},
		},
	},
	config = function(_, opts)
		require("avante").setup(opts)

		local function apply_nvchad_style()
			local ok, base46 = pcall(require, "base46")
			if not ok then
				return
			end
			local colors = base46.get_theme_tb("base_30")
			if not colors or type(colors) ~= "table" then
				return
			end

			vim.api.nvim_set_hl(0, "AvanteNormal", { bg = colors.black, fg = colors.white })
			vim.api.nvim_set_hl(0, "AvantePopup", { bg = colors.darker_black, fg = colors.white })
			vim.api.nvim_set_hl(0, "AvanteTitle", { bg = colors.red, fg = colors.black, bold = true })
			vim.api.nvim_set_hl(0, "AvanteSubtitle", { bg = colors.one_bg, fg = colors.blue, bold = true })
			vim.api.nvim_set_hl(0, "AvanteBorder", { fg = colors.line })
			vim.api.nvim_set_hl(0, "AvanteConflictCurrent", { bg = colors.one_bg2 })
			vim.api.nvim_set_hl(0, "AvanteConflictIncoming", { bg = colors.one_bg3 })
		end

		apply_nvchad_style()
		vim.api.nvim_create_autocmd("User", {
			pattern = "NvChadThemeReload",
			callback = apply_nvchad_style,
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"ibhagwan/fzf-lua",
		"folke/snacks.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					use_absolute_path = true,
				},
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
