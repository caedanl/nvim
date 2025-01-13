return {
	{
		"saghen/blink.cmp",
		lazy = false, -- lazy loading handled internally
		-- optional: provides snippets for the snippet source
		dependencies = "rafamadriz/friendly-snippets",

		-- use a release tag to download pre-built binaries
		version = "v0.9.*",
		opts = {
			keymap = {
				preset = "enter",
				-- ["<CR>"] = { "select_and_accept", "fallback" },
				-- ["<Tab>"] = { "select_and_accept", "fallback" },
				cmdline = {
					preset = "super-tab",
					-- ["<Tab>"] = { "select_and_accept", "fallback" },
				},
			},
			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			signature = { enabled = true },

			completion = {
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},
				menu = {
					draw = {
						columns = {
							{ "kind_icon", "label", "label_description", gap = 1 },
							{ "kind" },
						},
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 0,
				},
			},
		},
		opts_extend = { "sources.default" },
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		opts = {
			sources = {
				completion = {
					enabled_providers = { "lsp", "path", "snippets", "buffer", "lazydev" },
				},
				providers = {
					lsp = { fallback_for = { "lazydev" } },
					lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
				},
			},
			servers = {
				lua_ls = {},
				pyright = {},
				ts_ls = {},
				tailwindcss = {},
				eslint = {
					on_attach = function(_, bufnr)
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = bufnr,
							command = "EslintFixAll",
						})
					end,
					workingDirectories = { mode = "auto" },
					format = true,
				},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local keymap = vim.keymap -- for conciseness
					local keymapOpts = { buffer = ev.buf, silent = true }

					keymapOpts.desc = "Show LSP references"
					keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", keymapOpts) -- show definition, references

					keymapOpts.desc = "Go to definition"
					keymap.set("n", "gd", vim.lsp.buf.definition, keymapOpts) -- go to declaration

					keymapOpts.desc = "Go to declaration"
					keymap.set("n", "gD", vim.lsp.buf.declaration, keymapOpts) -- go to declaration

					-- opts.desc = "Show LSP definitions"
					-- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", keymapOpts) -- show lsp definitions

					keymapOpts.desc = "Show LSP implementations"
					keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", keymapOpts) -- show lsp implementations

					keymapOpts.desc = "Show LSP type definitions"
					keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", keymapOpts) -- show lsp type definitions

					keymapOpts.desc = "Smart rename"
					keymap.set("n", "<leader>rn", vim.lsp.buf.rename, keymapOpts) -- smart rename

					keymapOpts.desc = "See available code actions"
					keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, keymapOpts) -- see available code actions, in visual mode will apply to selection

					keymapOpts.desc = "Show line diagnostics"
					keymap.set("n", "<leader>d", vim.diagnostic.open_float, keymapOpts) -- show diagnostics for line
				end,
			})

			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,
	},
}
