return {
	'Chaitanyabsprip/fastaction.nvim',
	opts = {},
	config = function()
		local fastaction = require('fastaction')
		fastaction.setup({})
		vim.keymap.set("n", "<C-a>", function()
			fastaction.code_action()
		end)
		vim.keymap.set('n', "<C-i>", "<C-i>", { noremap = true })
		vim.keymap.set('n', "<Tab>", function()
			if #vim.api.nvim_list_wins() > 1 then
				pcall(vim.cmd, "close")
			end
			local diagnostics = vim.diagnostic.get(0)
			if #diagnostics == 0 then
				return
			end
			vim.diagnostic.goto_next()
			fastaction.code_action()
		end)
	end
}
