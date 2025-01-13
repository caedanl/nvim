return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({
				files = {
					file_icons = false,
				},
				winopts = {
					fullscreen = true,
					preview = {
						layout = "vertical",
					},
				},
			})

			-- vim.keymap.set("n", "<leader>sf", require('fzf-lua').files, { desc = "Fzf Files" })
		end,
	},
}
