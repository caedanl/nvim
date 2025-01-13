return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 35,
				number = false,
				relativenumber = false,
			},
			diagnostics = {
				enable = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			renderer = {
				highlight_git = "all",
				highlight_opened_files = "all",
				indent_markers = {
					enable = true,
				},
				icons = {
					show = {
						folder_arrow = true,
					},
					glyphs = {
						default = "󰈚",
						symlink = "",
						folder = {
							-- default = "",
							-- open = "",
							-- empty = "",
							-- empty_open = "",
							default = "/",
							open = "/",
							empty = "/",
							empty_open = "/",
							-- default = "",
							-- empty = "",
							-- empty_open = "",
							-- open = "",
							-- symlink = "",
							-- symlink_open = "",
							-- arrow_open = "",
							-- arrow_closed = "",
						},
						-- git = {
						-- 	unstaged = "✗",
						-- 	staged = "✓",
						-- 	unmerged = "",
						-- 	renamed = "➜",
						-- 	untracked = "",
						-- 	deleted = "",
						-- 	ignored = "◌",
						-- },
						git = {
							unstaged = "",
							staged = "",
							unmerged = "",
							renamed = "",
							untracked = "",
							deleted = "",
							ignored = "",
						},
					},
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				dotfiles = false,
				custom = { "node_modules", ".DS_Store" },
			},
			git = {
				enable = true,
				ignore = false,
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" }) -- toggle file explorer
		keymap.set("n", "<leader>et", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
		keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>", { desc = "Focus file explorer on current file" }) -- toggle file explorer on current file
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
	end,
}
