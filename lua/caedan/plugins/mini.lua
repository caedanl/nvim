return {
	{
		"echasnovski/mini.nvim",
		config = function()
			-- require('mini.statusline').setup({use_icons = false})

			-- require('mini.files').setup()

			require("mini.pairs").setup()

			-- require("mini.tabline").setup()
		end,
		lazy = false,
		-- keys = {
		--   {"<leader>o", ":lua MiniFiles.open()<CR>", desc = "MiniFiles"}
		-- }
	},
}
