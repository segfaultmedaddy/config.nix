-- Keep Ctrl+B available to applications inside a pane.
rex.bind("ctrl+b>ctrl+b", "pane.send_key", { key = "ctrl+b" })

-- Ctrl+B, then W enters pane mode; Escape leaves it.
rex.mode("panes", { exclusive = true })
rex.bind("ctrl+b>w", "client.mode.enter", { name = "panes" })
rex.bind("panes/h", "pane.focus", { direction = "left" })
rex.bind("panes/j", "pane.focus", { direction = "down" })
rex.bind("panes/k", "pane.focus", { direction = "up" })
rex.bind("panes/l", "pane.focus", { direction = "right" })
rex.bind("panes/tab", "pane.focus_next")
rex.bind("panes/shift+tab", "pane.focus_previous")

rex.bind("panes/v", "pane.split", { direction = "right" })
rex.bind("panes/shift+h", "pane.split", { direction = "down" })
rex.bind("panes/x", "pane.close")
rex.bind("panes/z", "pane.zoom")

-- Resize mode: move the divider repeatedly, then leave with Esc.
rex.mode("resize", { exclusive = true })
rex.bind("panes/r", "client.mode.enter", { name = "resize" })
rex.bind("resize/h", "pane.resize", { direction = "left" })
rex.bind("resize/j", "pane.resize", { direction = "down" })
rex.bind("resize/k", "pane.resize", { direction = "up" })
rex.bind("resize/l", "pane.resize", { direction = "right" })
rex.bind("resize/left", "pane.resize", { direction = "left" })
rex.bind("resize/down", "pane.resize", { direction = "down" })
rex.bind("resize/up", "pane.resize", { direction = "up" })
rex.bind("resize/right", "pane.resize", { direction = "right" })
rex.bind("resize/enter", "client.mode.exit")

-- Open a fresh tab without disturbing the current pane.
rex.action({
	name = "opencode_nvim",
	title = "Open OpenCode and Neovim",
	category = "Pane",
	run = function(ctx)
		local cwd
		if ctx.block_id then
			local process = rex.block.call("com.superlogical.terminal", "process", {
				block_id = ctx.block_id,
			})
			cwd = process and process.foreground and process.foreground.cwd
		end

		local shell = "com.superlogical.terminal.shell"
		local window, err = rex.session.new_window({
			window_label = "OpenCode + Neovim",
			layout = rex.layout.horizontal(
				0.5,
				rex.layout.block({
					flavor = shell,
					options = { cwd = cwd, command = { "opencode" } },
				}),
				rex.layout.block({
					flavor = shell,
					options = { cwd = cwd, command = { "nvim" } },
				})
			),
		})
		if err ~= nil then
			error(err, 0)
		end
		return { window_id = window.window_id }
	end,
})

rex.bind("ctrl+b>o", "opencode_nvim")
