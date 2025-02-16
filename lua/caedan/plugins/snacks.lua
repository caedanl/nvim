return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		keys = {
			{
				"<leader>f",
				function()
					require("snacks").picker.files({
						layout = {
							preset = "vertical",
							layout = {
								-- box = "",
								width = 0.8,
								min_width = 120,
								height = 0.8,
								-- {
								-- 	box = "vertical",
								-- 	border = "rounded",
								-- 	title = "{title} {live} {flags}",
								-- 	{ win = "input", height = 1, border = "bottom" },
								-- 	{ win = "list", border = "none" },
								-- },
								-- { win = "preview", title = "{preview}", border = "rounded" },
							},
						},
					})
				end,
				desc = "Find files",
			},
			{
				"<leader>i",
				function()
					require("snacks").picker.smart({
						layout = {
							preset = "vertical",
							layout = {
								width = 0.8,
								min_width = 120,
								height = 0.8,
							},
						},
					})
				end,
				desc = "Find files",
			},
		},
		opts = {
			dashboard = {
				enabled = true,
				-- {
				-- 	action = ":Telescope find_files",
				-- 	key = "f",
				-- },
			},
			scroll = {
				animate = {
					duration = { step = 15, total = 100 },
				},
			},
			lazygit = {
				enabled = true,
			},
			gitbrowse = { enabled = true },
			-- 	indent = {
			-- 		enabled = true,
			-- 		animate = { enabled = false },
			-- 		only_scope = true,
			-- 		only_current = true,
			-- 		scope = { enabled = true },
			-- 		chunk = { enabled = true, hl = "SnacksIndent" },
			-- 	},
			notifier = { enabled = true },
			picker = {
				enabled = true,
				formatters = {
					file = {
						filename_first = false,
						truncate = 80,
					},
				},
			},
			indent = {
				indent = {
					priority = 1,
					enabled = true, -- enable indent guides
					char = "│",
					only_scope = true, -- only show indent guides of the scope
					only_current = true, -- only show indent guides in the current window
					hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
				},
				animate = {
					enabled = false,
				},
				scope = {
					enabled = true, -- enable highlighting the current scope
					priority = 200,
					char = "│",
					underline = false, -- underline the start of the scope
					only_current = true, -- only show scope in the current window
					hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
				},
				chunk = {
					-- when enabled, scopes will be rendered as chunks, except for the
					-- top-level scope which will be rendered as a scope.
					enabled = true,
					-- only show chunk scopes in the current window
					only_current = false,
					priority = 200,
					hl = "SnacksIndentScope", ---@type string|string[] hl group for chunk scopes
					char = {
						corner_top = "┌",
						corner_bottom = "└",
						-- corner_top = "╭",
						-- corner_bottom = "╰",
						horizontal = "─",
						vertical = "│",
						arrow = ">",
					},
				},
				-- filter for buffers to enable indent guides
				filter = function(buf)
					return vim.g.snacks_indent ~= false
						and vim.b[buf].snacks_indent ~= false
						and vim.bo[buf].buftype == ""
				end,
			},
		},
	},
}
