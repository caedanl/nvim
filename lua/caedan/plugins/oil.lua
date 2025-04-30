return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		keys = { { "<leader>o", "<CMD>Oil<CR>", desc = "Open parent directory" } },
		opts = {
			keymaps = {
				["<Esc>"] = { "actions.close", mode = "n" },
			},
			view_options = {
				show_hidden = true,
			},
		},
	},
}
