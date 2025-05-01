return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-jest",
		},
		keys = {
			{ "<leader>tr", "<cmd>Neotest run<cr>" },
			{ "<leader>ts", "<cmd>Neotest summary<cr>" },
			{ "<leader>ti", "<cmd>Neotest output-panel<cr>" },
			{ "<leader>tt", "<cmd>Neotest output<cr>" },
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-jest"),
				},
			})
		end,
	},
}
