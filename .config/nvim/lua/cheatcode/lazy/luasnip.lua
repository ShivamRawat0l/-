return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	config = function()
		vim.cmd [[
			imap <silent><expr> <C-y> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-y>'
			smap <silent><expr> <C-y> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-y>'
			imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
			smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
		]]
		local ls = require "luasnip"

		vim.snippet.expand = ls.lsp_expand

		vim.snippet.active = function(filter)
			filter = filter or {}
			filter.direction = filter.direction or 1

			if filter.direction == 1 then
				return ls.expand_or_jumpable()
			else
				return ls.jumpable(filter.direction)
			end
		end

		vim.snippet.jump = function(direction)
			if direction == 1 then
				if ls.expandable() then
					return ls.expand_or_jump()
				else
					return ls.jumpable(1) and ls.jump(1)
				end
			else
				return ls.jumpable(-1) and ls.jump(-1)
			end
		end

		vim.snippet.stop = ls.unlink_current
		ls.config.set_config {
			history = true,
			updateevents = "TextChanged,TextChangedI",
			override_builtin = true,
		}
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/cheatcode/lazy/LuaSnip/" })
		vim.keymap.set({ "i", "s" }, "<c-k>", function()
			return vim.snippet.active { direction = 1 } and vim.snippet.jump(1)
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<c-j>", function()
			return vim.snippet.active { direction = -1 } and vim.snippet.jump(-1)
		end, { silent = true })
		require("luasnip").config.set_config({ -- Setting LuaSnip config
			enable_autosnippets = true,
			store_selection_keys = "<Tab>",
		})
	end
}
