return {
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>df", "<cmd>DiffviewFileHistory %<CR>", desc = "Open diffview file history" },
			{ "<leader>dx", "<cmd>DiffviewClose<CR>", desc = "Close diffview" },
		},
	},
}
