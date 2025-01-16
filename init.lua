-- vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

require("caedan.core")
require("caedan.lazy")

-- Set colorscheme
-- vim.cmd.colorscheme("rose-pine-dawn")
-- vim.cmd.colorscheme("rose-pine-moon")
-- vim.cmd.colorscheme("rose-pine-main")
vim.cmd.colorscheme("tokyonight-moon")
-- vim.cmd.colorscheme("vesper")
-- vim.cmd.colorscheme("jb")

-- Init stuff for Lualine because doing this inside the config function doesn't work properly
local lualine = require("lualine")

local auto_theme_custom = require("lualine.themes.auto")
auto_theme_custom.normal.c.bg = ""
auto_theme_custom.inactive.c.bg = ""
-- auto_theme_custom.insert.c.bg = ""
-- auto_theme_custom.visual.c.bg = ""
-- auto_theme_custom.command.c.bg = ""

lualine.setup({
	options = {
		theme = auto_theme_custom,
		icons_enabled = false,
		component_separators = "",
		section_separators = "",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { { "branch", color = { bg = "" } } },
		lualine_c = { { "filename", color = { bg = "" } } },
		lualine_x = { { "filetype", color = { bg = "" } } },
		lualine_y = { { "progress", color = { bg = "" } } },
		lualine_z = { { "location" } },
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
})
