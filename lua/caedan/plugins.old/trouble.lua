return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {
		focus = true,
		open_no_results = true,
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>rb",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{ "<leader>rw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
		{ "<leader>rt", "<cmd>Trouble todo toggle filter.buf=0<CR>", desc = "Buffer Todos (Trouble)" },
		{ "<leader>rT", "<cmd>Trouble todo toggle<CR>", desc = "Todos (Trouble)" },
	},
}
