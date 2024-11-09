-- Basic appearance
vim.g.neovide_transparency = 0.9
-- vim.opt.guifont = "FiraCode Nerd Font:h12"

-- Cursor effects
vim.g.neovide_cursor_animation_length = 0.1
vim.g.neovide_cursor_trail_length = 0.5
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
vim.g.neovide_cursor_vfx_particle_density = 10.0
vim.g.neovide_cursor_vfx_opacity = 200.0

-- Window effects and scaling
vim.g.neovide_initial_window_width = 1280
vim.g.neovide_initial_window_height = 720
vim.g.neovide_fullscreen = false
vim.g.neovide_maximized = false
vim.g.neovide_no_idle_tiling = true
vim.g.neovide_scale_factor = 1.0

-- Performance and refresh rate
vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 5

-- Miscellaneous
vim.g.neovide_remember_window_size = true
vim.g.neovide_input_use_logo = true -- Enable Cmd as meta on MacOS
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_input_use_alt_key = true -- Use Alt key for shortcuts on Windows
