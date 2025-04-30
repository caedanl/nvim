return {
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>mp",
				function()
					require("conform").format({
						lsp_fallback = true,
						async = true,
						timeout_ms = 1000,
					})
				end,
				mode = { "n", "v" },
				desc = "Format file or range (in visual mode)",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				terraform = { "terraform_fmt" },
				python = { "isort", "black" },
				rust = { "rustfmt", lsp_format = "fallback" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
}
