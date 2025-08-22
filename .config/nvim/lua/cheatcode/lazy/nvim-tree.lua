vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	api.config.mappings.default_on_attach(bufnr)
	vim.keymap.set('n', ';', api.node.open.edit, opts('Open'))
	vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
	vim.keymap.set('n', '<C-y>', api.node.open.edit, opts('Open'))
	vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Up'))
	vim.keymap.set('n', '-', api.node.navigate.parent_close, opts('Up'))
end

local HEIGHT_RATIO = 1
local WIDTH_RATIO = 1

return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup {
			on_attach = my_on_attach,
			disable_netrw = true,
			update_focused_file = {
				enable = true,
				update_root = false,
				ignore_list = {},
			},
			hijack_netrw = false,
			respect_buf_cwd = true,
			sync_root_with_cwd = true,
			view = {
				relativenumber = true,
				float = {
					enable = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
						local window_w = screen_w * WIDTH_RATIO
						local window_h = screen_h * HEIGHT_RATIO
						local window_w_int = math.floor(window_w)
						local window_h_int = math.floor(window_h)
						local center_x = (screen_w - window_w) / 2
						local center_y = ((vim.opt.lines:get() - window_h) / 2)
							- vim.opt.cmdheight:get()
						return {
							border = "rounded",
							relative = "editor",
							row = center_y,
							col = center_x,
							width = window_w_int,
							height = window_h_int,
						}
					end,
				},
				width = function()
					return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
				end,
			},
		}
		vim.keymap.set("n", "<C-->", ":NvimTreeFocus<CR>", { silent = true })
		vim.keymap.set("n", "=", ":NvimTreeFocus<CR>", { silent = true })
	end
}
