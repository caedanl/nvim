return {
	{
		"axelvc/template-string.nvim",
		ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
		config = function()
			require("template-string").setup({
				remove_template_string = true,
			})
		end,
	},
}
