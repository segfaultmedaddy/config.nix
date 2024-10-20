local wezterm = require("wezterm")
local action = wezterm.action
local M = {}

local split_pane_actions = {
	up = action.SplitPane({ direction = "Up", size = { Percent = 50 } }),
	down = action.SplitPane({ direction = "Down", size = { Percent = 50 } }),
	left = action.SplitPane({ direction = "Left", size = { Percent = 50 } }),
	right = action.SplitPane({ direction = "Right", size = { Percent = 50 } }),
}

M.keys = {
	{ key = "t", mods = "CTRL", action = action.SpawnTab("CurrentPaneDomain") },
	{
		key = "w",
		mods = "LEADER",
		action = action.ActivateKeyTable({
			name = "pane",
		}),
	},
}

M.key_tables = {
	pane = {
		-- Split panes.
		{ key = "UpArrow", action = split_pane_actions.up },
		{ key = "k", action = split_pane_actions.up },
		{ key = "DownArrow", action = split_pane_actions.down },
		{ key = "j", action = split_pane_actions.down },
		{ key = "LeftArrow", action = split_pane_actions.left },
		{ key = "h", action = split_pane_actions.left },
		{ key = "RightArrow", action = split_pane_actions.right },
		{ key = "l", action = split_pane_actions.right },
		{
			key = "v",
			action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},

		-- Switch focus to a different pane
		{
			key = "s",
			action = action.PaneSelect({ alphabet = "1234567890" }),
		},

		-- Swap the current pane with another pane
		{
			key = "r",
			action = action.PaneSelect({
				mode = "SwapWithActive",
				alphabet = "1234567890",
			}),
		},
	},
}

return M
