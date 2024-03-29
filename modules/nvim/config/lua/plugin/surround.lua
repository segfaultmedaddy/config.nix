return {
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				keymaps = {
					insert = "<C-g>s",
					insert_line = "<C-g>S",
					normal = "<leader>s",
					normal_cur = "<leader>ss",
					normal_line = "yS",
					normal_cur_line = "ySS",
					visual = "S",
					visual_line = "gS",
					delete = "ds",
					change = "cs",
					change_line = "cS",
				},
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			enable_check_bracket_line = true,
		},
	},
}
