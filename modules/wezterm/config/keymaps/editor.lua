local wezterm = require("wezterm")
local action = wezterm.action

local M = {}

local move_cursor_actions = {
	backward = action.SendString("\x1bb"),
	forward = action.SendString("\x1bf"),
}

M.keys = {
	{ key = "Escape", mods = "LEADER", action = action.ActivateCopyMode },

	-- Move cursor forward/backward by word
	{
		key = "LeftArrow",
		mods = "SHIFT",
		action = move_cursor_actions.backward,
	},
	{ key = "RightArrow", mods = "SHIFT", action = move_cursor_actions.forward },
	{
		key = "LeftArrow",
		mods = "OPT",
		action = move_cursor_actions.backward,
	},
	{ key = "RightArrow", mods = "OPT", action = move_cursor_actions.forward },
}

return M
