return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			dashboard = {
				{
					action = ":Telescope find_files",
					key = "f",
				},
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
			indent = { enabled = true, animate = { enabled = false } },
			notifier = { enabled = true },
			picker = {
				enabled = true,
				-- layout = {
				-- 	preset = "vscode",
				-- },
			},
		},
	},
}
