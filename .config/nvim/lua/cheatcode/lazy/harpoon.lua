return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			default = {
				display = function(list_item)
					local filename = vim.fn.fnamemodify(list_item.value, ":t")
					return filename
				end,
			},
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = false,
			},
		})
		vim.keymap.set("n", ";", function()
			if vim.bo.filetype == "harpoon" then
				harpoon.ui:select_menu_item();
			end
		end)
		vim.keymap.set("n", "<C-v>", function() harpoon.ui:select_menu_item({ vsplit = true }) end)
		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
		vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<C-;>", function() harpoon:list():select(4) end)
	end
}
