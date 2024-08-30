local wezterm = require("wezterm")

local M = {}

M.color_scheme_dirs = {
  "/Users/roman/.local/share/nvim/lazy/nightfox.nvim/extra/dayfox"
}
M.color_scheme = "dayfox"

-- Fonts
M.font = wezterm.font("SF Mono", {
  weight = "Medium",
})
M.font_size = 15
M.line_height = 1.1

-- Window
M.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Tabs
M.use_fancy_tab_bar = false
M.tab_bar_at_bottom = true
M.hide_tab_bar_if_only_one_tab = true
M.show_tab_index_in_tab_bar = false

return M
