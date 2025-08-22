return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		grep = {
			fuzzy = true,
		}
	},
	config = function()
		vim.api.nvim_set_keymap("n", "<C-f>", [[<Cmd>lua require"fzf-lua".live_grep_native()<CR><C-g>]], {})
		vim.api.nvim_set_keymap("n", "<C-p>", [[<Cmd>lua require"fzf-lua".git_files()<CR>]], {})
		vim.api.nvim_set_keymap("n", "<leader>pf", [[<Cmd>lua require"fzf-lua".live_grep_glob()<CR>]], {})
		vim.api.nvim_set_keymap("n", "<leader>ps", [[<Cmd>lua require"fzf-lua".files()<CR>]], {})
	end
}
