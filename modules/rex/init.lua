-- Keep Ctrl+B available to applications inside a pane.
rex.bind("ctrl+b>ctrl+b", "pane.send_key", { key = "ctrl+b" })

-- Herdr's default pane bindings, using Ctrl+B as the prefix.
rex.bind("ctrl+b>h", "pane.focus", { direction = "left" })
rex.bind("ctrl+b>j", "pane.focus", { direction = "down" })
rex.bind("ctrl+b>k", "pane.focus", { direction = "up" })
rex.bind("ctrl+b>l", "pane.focus", { direction = "right" })
rex.bind("ctrl+b>tab", "pane.focus_next")
rex.bind("ctrl+b>shift+tab", "pane.focus_previous")

rex.bind("ctrl+b>v", "pane.split", { direction = "right" })
rex.bind("ctrl+b>h", "pane.split", { direction = "down" })
rex.bind("ctrl+b>x", "pane.close")
rex.bind("ctrl+b>z", "pane.zoom")

-- Herdr's resize mode: move the divider repeatedly, then leave with Esc.
rex.mode("resize", { exclusive = true })
rex.bind("ctrl+b>r", "client.mode.enter", { name = "resize" })
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
