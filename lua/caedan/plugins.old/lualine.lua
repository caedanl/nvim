return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		local custom_colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			red = "#FF4A4A",
			white = "#c3ccdc",
			black = "#112638",
			inactive_bg = "#2c3043",
			transparent = "",
		}

		local gb_colors = {
			black = "#282828",
			white = "#ebdbb2",
			red = "#fb4934",
			green = "#b8bb26",
			blue = "#83a598",
			yellow = "#fe8019",
			gray = "#a89984",
			darkgray = "#3c3836",
			lightgray = "#504945",
			inactivegray = "#7c6f64",
			transparent = "",
		}

		-- local colors = {
		-- 	normal = custom_colors.blue,
		-- 	insert = custom_colors.green,
		-- 	visual = custom_colors.violet,
		-- 	command = custom_colors.yellow,
		-- 	replace = custom_colors.red,
		-- 	inactive = custom_colors.inactive_bg,
		-- 	fg = custom_colors.white,
		-- 	bg = custom_colors.black,
		-- }
		local colors = {
			normal = gb_colors.gray,
			insert = gb_colors.blue,
			visual = custom_colors.yellow,
			replace = gb_colors.red,
			command = gb_colors.green,
			inactive = gb_colors.darkgray,
			fg = gb_colors.white,
			bg = gb_colors.black,
		}

		local my_lualine_theme = {
			normal = {
				a = { bg = colors.normal, fg = colors.bg, gui = "bold" },
				b = { fg = colors.fg },
				c = { fg = colors.fg },
			},
			insert = {
				a = { bg = colors.insert, fg = colors.bg, gui = "bold" },
				b = { fg = colors.fg },
				c = { fg = colors.fg },
			},
			visual = {
				a = { bg = colors.visual, fg = colors.bg, gui = "bold" },
				b = { fg = colors.fg },
				c = { fg = colors.fg },
			},
			command = {
				a = { bg = colors.command, fg = colors.bg, gui = "bold" },
				b = { fg = colors.fg },
				c = { fg = colors.fg },
			},
			replace = {
				a = { bg = colors.replace, fg = colors.bg, gui = "bold" },
				b = { fg = colors.fg },
				c = { fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive, fg = colors.semilightgray, gui = "bold" },
				b = { fg = colors.semilightgray },
				c = { fg = colors.semilightgray },
				-- b = { bg = colors.inactive_bg, fg = colors.semilightgray },
				-- c = { bg = colors.inactive_bg, fg = colors.semilightgray },
			},
		}

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = my_lualine_theme,
				-- component_separators = "",
				-- section_separators = "",
				disabled_filetypes = {
					statusline = {
						"NvimTree",
					},
					winbar = {
						"NvimTree",
					},
				},
			},
			sections = {
				lualine_c = {},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{ "filename", newfile_status = true, path = 1, file_status = false },
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{ "filename", newfile_status = true, path = 1 },
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "nvim-tree", "trouble" },
		})
	end,
}
