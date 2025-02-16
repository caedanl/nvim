return {
	{
		"sindrets/diffview.nvim",
		config = function()
			vim.keymap.set("n", "<leader>df", "<cmd>DiffviewFileHistory %<CR>", { desc = "Open diffview file history" })
			vim.keymap.set("n", "<leader>dx", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" })
		end,
	},
}
