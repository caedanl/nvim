return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
		init = function()
			-- vim.cmd.colorscheme("tokyonight-night")
			-- vim.cmd.colorscheme("tokyonight")

			vim.cmd.hi("Comment gui=none")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				enable = {
					terminal = true,
				},
				styles = {
					bold = true,
					transparency = true,
				},
			})
		end,
	},
	{
		"datsfilipe/vesper.nvim",
		opts = {
			transparent = true,
		},
	},
}
