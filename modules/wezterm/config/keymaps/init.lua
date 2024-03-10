local util = require("util")
local panes = require("keymaps.panes")
local editor = require("keymaps.editor")

local M = {}

-- M.disable_default_key_bindings = true

M.leader = { key = "Space", mods = "OPT" }

util.assign(M, { panes, editor })

return M
