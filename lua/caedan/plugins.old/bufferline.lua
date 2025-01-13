return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			indicator = {
				style = "none",
			},
			modified_icon = "[+]",
			show_close_icon = false,
			show_buffer_icons = false,
			show_buffer_close_icons = false,
			-- show_tab_indicators = false,
			separator_style = { "", "" },
			mode = "tabs",
			offsets = {
				{
					filetype = "NvimTree",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
}
