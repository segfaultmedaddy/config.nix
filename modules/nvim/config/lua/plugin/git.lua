return {
	{
		"kdheepak/lazygit.nvim",
	},
	{ "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			numhl = true,
			linehl = true,
		},
	},
}
