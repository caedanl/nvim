return {
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				keymaps = {
					["<Esc>"] = { "actions.close", mode = "n" },
				},
				view_options = {
					show_hidden = true,
				},
			})
			vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
		-- Optional dependencies
		-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	},
}
