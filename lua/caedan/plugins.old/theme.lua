return {
	"folke/tokyonight.nvim",
	opts = {
		transparent = true,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
	},
	priority = 1000,
	init = function()
		-- vim.cmd.colorscheme("tokyonight-night")
		vim.cmd.colorscheme("tokyonight-storm")

		vim.cmd.hi("Comment gui=none")
	end,
}

-- One Dark Pro
-- return {
-- 	"olimorris/onedarkpro.nvim",
-- 	priority = 1000, -- Ensure it loads first
-- 	init = function()
-- 		vim.cmd("colorscheme onedark")
-- 		require("onedarkpro").setup({
-- 			options = {
-- 				transparency = true,
-- 			},
-- 		})
-- 	end,
-- }
--
--
-- opts = {}

-- GRUVBOX
-- return {
-- 	"ellisonleao/gruvbox.nvim",
-- 	priority = 1000,
-- 	config = true,
-- 	init = function()
-- 		require("gruvbox").setup({
-- 			transparent_mode = true,
-- 		})
-- 		-- vim.o.background = "dark" -- or "light" for light mode
-- 		vim.cmd([[colorscheme gruvbox]])
-- 	end,
-- }
