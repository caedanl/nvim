return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text_pos = "right_align",
			delay = 0,
		},
		preview_config = {
			border = "none",
		},
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end)

			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end)

			-- Actions
			-- map("n", "<leader>hs", gitsigns.stage_hunk)
			map("n", "<leader>hr", gitsigns.reset_hunk)
			-- map("v", "<leader>hs", function()
			-- 	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			-- end)
			-- map("v", "<leader>hr", function()
			-- 	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			-- end)
			-- map("n", "<leader>hS", gitsigns.stage_buffer)
			-- map("n", "<leader>hu", gitsigns.undo_stage_hunk)
			-- map("n", "<leader>hR", gitsigns.reset_buffer)
			map("n", "<leader>hp", gitsigns.preview_hunk_inline)
			-- map("n", "<leader>hb", function()none
			-- 	gitsigns.blame_line({ full = true })
			-- end)
			-- map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
			-- map("n", "<leader>hd", gitsigns.diffthis)
			-- map("n", "<leader>hD", function()
			-- 	gitsigns.diffthis("~")
			-- end)
			map("n", "<leader>tq", gitsigns.toggle_deleted)
		end,
	},
	-- config = function()
	-- 	local gs = require("gitsigns")
	-- 	require("gitsigns").setup({
	-- 		-- signs = {
	-- 		-- 	add = { text = "+" },
	-- 		-- 	change = { text = "+" },
	-- 		-- 	delete = { text = "_" },
	-- 		-- 	topdelete = { text = "‾" },
	-- 		-- 	changedelete = { text = "~" },
	-- 		-- 	untracked = { text = "┆" },
	-- 		-- },
	-- 		-- signs_staged = {
	-- 		-- 	add = { text = "+" },
	-- 		-- 	change = { text = "+" },
	-- 		-- 	delete = { text = "_" },
	-- 		-- 	topdelete = { text = "‾" },
	-- 		-- 	changedelete = { text = "~" },
	-- 		-- 	untracked = { text = "┆" },
	-- 		-- },
	-- 		current_line_blame = true,
	-- 		current_line_blame_opts = {
	-- 			virt_text_pos = "right_align",
	-- 			delay = 0,
	-- 		},
	-- 	})
	--
	-- 	vim.keymap.set("n", "<leader>hp", gs.preview_hunk)
	-- 	vim.keymap.set("n", "]c", require("gitsigns").nav_hunk("next"))
	-- 	vim.keymap.set("n", "[c", gs.nav_hunk("prev"))
	-- end,
}
