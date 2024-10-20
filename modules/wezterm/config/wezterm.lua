local wezterm = require("wezterm")
local util = require("util")

-- Modules
local ui = require("ui")
local keymaps = require("keymaps")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- General
config.window_close_confirmation = "NeverPrompt" -- don't ask when closing window/tab.

-- see https://wezfurlong.org/wezterm/config/lua/config/term.html for prerequisites.
-- config.term = "wezterm"
config.native_macos_fullscreen_mode = true -- Use native fullscreen mode on macOs.

local M = util.assign(config, { ui, keymaps })

return M
