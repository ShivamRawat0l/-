require("cheatcode.set")
require("cheatcode.remap")
require("cheatcode.lazy_init")
require("cheatcode.terminal")
require("cheatcode.session")
require("cheatcode.surround")

local augroup = vim.api.nvim_create_augroup
local LSP_GROUP = augroup('cheatcode', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

vim.diagnostic.config({
	virtual_text = { current_line = true },
	virtual_lines = false,
	underline = true,
	update_in_insert = false
})


vim.filetype.add({
	extension = {
		templ = 'templ',
	}
})

autocmd('TextYankPost', {
	group = yank_group,
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({
			higroup = 'IncSearch',
			timeout = 40,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = LSP_GROUP,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
	group = LSP_GROUP,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
		vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
		vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
		vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	end
})

vim.api.nvim_set_option_value("winfixbuf", false, {})

ColorMyPencils('bluloco')
