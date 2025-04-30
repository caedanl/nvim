return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		event = "VeryLazy",
		config = function()
			require("mason").setup({})

			require("mason-lspconfig").setup({
				ensure_installed = { "vtsls", "ts_ls", "pyright", "terraformls", "tailwindcss" },
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettierd", -- prettier formatter
					"stylua", -- lua formatter
					"pylint",
					"eslint",
					"eslint_d",
				},
			})
		end,
	},
}
