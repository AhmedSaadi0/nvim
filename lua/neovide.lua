-- Basic appearance
vim.g.neovide_transparency = 0.85
-- vim.opt.guifont = "FiraCode Nerd Font:h12"

-- Cursor effects
vim.g.neovide_cursor_animation_length = 0.04
vim.g.neovide_cursor_trail_length = 0.5
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
vim.g.neovide_cursor_vfx_opacity = 200.0

-- vim.g.neovide_cursor_vfx_mode = "sonicboom"
vim.g.neovide_cursor_vfx_mode = "railgun"
-- vim.g.neovide_cursor_vfx_mode = "ripple"
vim.g.neovide_cursor_vfx_particle_lifetime = 1.0

-- Window effects and scaling
-- vim.g.neovide_initial_window_width = 1280
-- vim.g.neovide_initial_window_height = 720
vim.g.neovide_fullscreen = false
vim.g.neovide_maximized = false
vim.g.neovide_no_idle_tiling = true
vim.g.neovide_scale_factor = 1.0

-- Performance and refresh rate
vim.g.neovide_refresh_rate = 240
vim.g.neovide_refresh_rate_idle = 5

-- Miscellaneous
vim.g.neovide_remember_window_size = true
-- vim.g.neovide_input_use_logo = true -- Enable Cmd as meta on MacOS
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_input_use_alt_key = true -- Use Alt key for shortcuts on Windows

-- Copy to system clipboard in normal, visual, and insert modes
vim.keymap.set({ "n", "x" }, "<C-S-C>", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("i", "<C-S-C>", '"+y', { desc = "Copy to system clipboard" })

-- Paste from system clipboard in normal, visual, and insert modes
vim.keymap.set("n", "<C-S-V>", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("x", "<C-S-V>", '"+P', { desc = "Paste from system clipboard" })
vim.keymap.set("i", "<C-S-V>", function()
	return vim.fn.getreg("+")
end, { expr = true, desc = "Paste system clipboard" })

vim.keymap.set("!", "<C-S-V>", "<C-r>+", { noremap = true, silent = true })

-- Apply mappings in Telescope prompt
local telescope_mappings = function()
	vim.api.nvim_buf_set_keymap(
		0,
		"i",
		"<C-S-C>",
		'"+y',
		{ noremap = true, silent = true, desc = "Copy to system clipboard" }
	)
	vim.api.nvim_buf_set_keymap(
		0,
		"i",
		"<C-S-V>",
		"<C-r>+",
		{ noremap = true, silent = true, desc = "Paste system clipboard" }
	)
end

-- Autocmd to apply mappings in TelescopePrompt windows
vim.api.nvim_create_autocmd("FileType", {
	pattern = "TelescopePrompt",
	callback = telescope_mappings,
})
