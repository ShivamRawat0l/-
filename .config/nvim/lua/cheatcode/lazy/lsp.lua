return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"j-hui/fidget.nvim",
		"onsails/lspkind.nvim",
	},
	config = function()
		local lspconfig = require('lspconfig')
		lspconfig.sourcekit.setup({
			capabilities = {
				workspace = {
					didChangeWatchedFiles = {
						dynamicRegistration = true,
					},
				},
			},
		})
		local cmp = require('cmp')
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities())

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup {
						capabilities = capabilities
					}
				end,

				zls = function()
					lspconfig.zls.setup({
						root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
						settings = {
							zls = {
								enable_inlay_hints = true,
								enable_snippets = true,
								warn_style = true,
							},
						},
					})
					vim.g.zig_fmt_parse_errors = 0
					vim.g.zig_fmt_autosave = 0
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup {
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
								}
							}
						}
					}
				end,
			}
		})
		--lspconfig.ts_ls.setup({
		--	on_attach = function(client, bufnr)
		--		require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
		--	end
		--})
		local lspkind = require("lspkind")
		cmp.setup({
			completion = {
				autocomplete = false
			},
			mapping = cmp.mapping.preset.insert({
				['<C-n>'] = function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						cmp.complete()
						cmp.select_next_item()
					end
				end,
				['C-p>'] = cmp.mapping.select_prev_item(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' }, -- For luasnip users.
			}, {
				{ name = 'path' },
				{ name = 'buffer' },
			}),
			formatting = {
				expandable_indicator = true,
				format = lspkind.cmp_format({
					ellipsis_char = "...",
					with_text = true,
					before = function(entry, vim_item)
						local item = entry:get_completion_item()

						if entry.source.name == 'nvim_lsp' then
							if not vim_item.menu and item.detail then
								vim_item.menu = item.detail
							end
						end

						if not vim_item.menu then
							vim_item.menu = ({
								buffer = "[buf]",
								nvim_lsp = "[LSP]",
								luasnip = "[snip]",
								path = "[path]",
								nvim_lua = "[api]",
							})[entry.source.name]
						end
						return vim_item
					end,
				})
			},
			window = {
				documentation = {
					border = "rounded",
					max_width = 120,
					max_height = 50,
					--winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
				},
				completion = {
					border = "rounded",
					--winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
				},
			},
		})

		vim.diagnostic.config({
			update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
		lspconfig.rust_analyzer.setup {
			settings = {
				['rust-analyzer'] = {
					diagnostics = {
						enable = false,
					}
				}
			}
		}
	end
}
