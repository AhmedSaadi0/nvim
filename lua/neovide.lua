-- =============================================================================
-- Neovide GUI Settings
-- =============================================================================
-- NOTE: This file should be conditionally loaded only when running Neovide.

-- Helper function to set Neovide options cleanly from a table
local function set_neovide_options(options)
	for k, v in pairs(options) do
		vim.g["neovide_" .. k] = v
	end
end

set_neovide_options({
	-- ------------------
	-- Appearance
	-- ------------------
	-- guifont = "JetBrainsMono Nerd Font:h11",
	opacity = 0.95,
	unfocused_contrast = 0.8,
	-- background_blur = 0.2,

	-- ------------------
	-- Window & Startup
	-- ------------------
	-- Set to true to automatically maximize the window on startup
	maximized = true,
	-- Remember window size and position.
	remember_window_size = true,
	-- Hide the mouse cursor when typing
	hide_mouse_when_typing = true,

	-- ------------------
	-- Animations & Visual Effects
	-- ------------------
	-- A shorter, snappier scroll animation
	scroll_animation_length = 0.35,

	-- Cursor animation settings
	cursor_animation_length = 0.01,
	cursor_trail_length = 0.0,
	cursor_antialiasing = true,

	-- Cursor VFX (Visual Effects)
	-- Modes: "railgun", "sonicboom", "ripple", "pixiedust", "torpedo", "wireframe"
	-- "ripple" is a clean, balanced default.
	cursor_vfx_mode = nil,
	cursor_vfx_opacity = 150.0, -- Opacity from 0.0 to 255.0
	cursor_vfx_particle_lifetime = 0.8,
	cursor_vfx_particle_density = 1.0,
	cursor_vfx_particle_speed = 1.0,

	-- ------------------
	-- Performance
	-- ------------------
	-- Target frames per second. High refresh rate monitors benefit from this.
	refresh_rate = 240,
	-- Lower refresh rate when Neovim is idle to save power
	refresh_rate_idle = 5,
	-- Disable idle refresh rate for tiling window managers to prevent flickering
	no_idle = false,
})

-- ------------------
-- Platform-Specific Settings
-- ------------------
-- Use Cmd key for mappings on macOS
if vim.fn.has("macunix") == 1 then
	vim.g.neovide_input_use_logo = true
else
	-- Use Alt key for mappings on Windows/Linux
	vim.g.neovide_input_use_alt_key = true
end

-- ------------------
-- Keymaps for GUI-like behavior (Ctrl+Shift+C/V)
-- ------------------
-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<C-S-c>", '"+y', { desc = "Copy to System Clipboard" })

-- Paste from system clipboard
vim.keymap.set("n", "<C-S-v>", '"+P', { desc = "Paste from System Clipboard" })
vim.keymap.set("v", "<C-S-v>", '"+P', { desc = "Paste from System Clipboard" })
vim.keymap.set("c", "<C-S-v>", "<C-R>+", { desc = "Paste from System Clipboard" })
vim.keymap.set("i", "<C-S-v>", "<C-R>+", { desc = "Paste from System Clipboard" })

-- NOTE: The above global keymaps should work in Telescope's prompt buffer.
-- A copy mapping for insert mode is omitted as it's not a standard Vim operation
-- and can have unintuitive behavior. Exit to normal mode (`<Esc>`) to copy.

print("Neovide settings loaded.")
