return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = "make" }
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				preview = {
					treesitter = true,
					syntax = true, -- Enable syntax highlighting
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,    -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				}
			}
		})
		telescope.load_extension('fzf')
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader><C-p>', builtin.find_files, {})
		vim.keymap.set('n', '<C-p>', builtin.git_files, {})
		vim.keymap.set('n', '<leader>ps', function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set('n', '<leader>pws', function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set('n', '<C-f>', function()
			builtin.live_grep()
		end)
		vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
		vim.keymap.set('n', '<leader>vc', builtin.colorscheme, {})
		vim.keymap.set('n', '<leader>vq', builtin.quickfix, {})
	end
}
