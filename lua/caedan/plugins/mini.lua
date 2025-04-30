return {
	{
		"echasnovski/mini.nvim",
		lazy = false,
		-- event = "InsertEnter",
		config = function()
			require("mini.pairs").setup()

			require("mini.icons").setup({
				style = "ascii",
			})

			-- require("mini.diff").setup({
			-- 	view = {
			-- 		style = "sign",
			-- 	},
			-- })
		end,
	},
}
