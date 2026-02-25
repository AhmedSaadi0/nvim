return {
	"saghen/blink.cmp",
	version = "*", -- استخدام أحدث إصدار مستقر
	dependencies = {
		"rafamadriz/friendly-snippets",
		-- سنحتفظ بـ LuaSnip لأن لديك مقتطفات (Snippets) مخصصة في مجلد lua/snippets
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
	},
	opts = {
		-- إعدادات الـ Snippets لتعمل مع LuaSnip
		snippets = { preset = "luasnip" },

		-- تفعيل إظهار معلومات الدوال (بديل lsp_signature.nvim)
		signature = { enabled = true },

		-- إعدادات الاختصارات (نفس اختصاراتك القديمة تماماً)
		keymap = {
			preset = "none", -- إلغاء الافتراضي لنبني اختصاراتك بدقة
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide" },
			["<CR>"] = { "accept", "fallback" },

			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },

			["<C-u>"] = { "scroll_documentation_up", "fallback" },
			["<C-d>"] = { "scroll_documentation_down", "fallback" },

			-- تعطيل الأسهم من التنقل في القائمة كما طلبت
			["<Up>"] = { "fallback" },
			["<Down>"] = { "fallback" },

			-- التنقل داخل الـ Snippets
			["<C-l>"] = { "snippet_forward", "fallback" },
			["<C-h>"] = { "snippet_backward", "fallback" },
		},

		appearance = {
			use_nvim_cmp_as_default = false, -- استخدام أيقونات blink الحديثة
			nerd_font_variant = "mono", -- لضمان محاذاة الأيقونات بشكل مثالي
		},

		-- إعدادات المصادر وأولوياتها (البديل لـ cmp.config.sources)
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				lsp = { score_offset = 10 },
				buffer = { score_offset = 8, min_keyword_length = 4 },
				path = { score_offset = 7 },
				snippets = { score_offset = 6 },
			},
		},

		completion = {
			-- إعدادات القائمة المنبثقة (Menu)
			menu = {
				border = "rounded", -- إطار دائري جميل للقائمة (يمكنك استخدام "single")
				draw = {
					-- ترتيب الأعمدة: [الأيقونة] مسافة [الاسم] مسافة [النوع]
					columns = {
						{ "kind_icon" }, -- الأيقونة أولاً على اليسار
						{ "label", "label_description", gap = 1 }, -- الكلمة المقترحة
						{ "kind" }, -- نوع الاقتراح (Function, Variable, Snippet) على اليمين
					},
					-- تحسين توافق الألوان (اختياري لكنه يعطي شكلاً رائعاً)
					treesitter = { "lsp" },
				},
			},

			-- نافذة التوثيق (الشرح الذي يظهر بجانب الاقتراح)
			documentation = {
				auto_show = true, -- إظهار الشرح تلقائياً
				auto_show_delay_ms = 250, -- تأخير بسيط لعدم إزعاج العين
				window = { border = "rounded" }, -- إطار متناسق مع القائمة
			},

			list = {
				-- دالة الفرز (Sorting) التي تعطي أولوية لعلامة التساوي "=" (التي كتبناها سابقاً)
				sort = {
					function(a, b)
						local label_a = a.label or ""
						local label_b = b.label or ""
						local has_equal_a = label_a:find("=") ~= nil
						local has_equal_b = label_b:find("=") ~= nil

						if has_equal_a and not has_equal_b then
							return true -- a يأتي أولاً
						elseif has_equal_b and not has_equal_a then
							return false -- b يأتي أولاً
						end
					end,
					"score",
					"sort_text",
				},
			},
		},
	},

	-- نستخدم config لتحميل المقتطفات (Snippets) الخاصة بك قبل تشغيل blink
	config = function(_, opts)
		local luasnip = require("luasnip")

		-- تحميل الـ Snippets الخاصة بـ VSCode و Lua المخصصة لك
		require("luasnip.loaders.from_vscode").load()
		require("luasnip.loaders.from_lua").load({ paths = { "./lua/snippets" } })

		-- تشغيل blink.cmp
		require("blink.cmp").setup(opts)
	end,
}
