return {
	"folke/trouble.nvim",
	opts = {
		auto_close = true, -- auto close when there are no items
		auto_open = true,
		focus = true,
		win = {
			type = "split",
			position = "right",
			relative = "win",
			size = 0.4,
		},
		auto_preview = false,
		keys = {
			[";"] = "jump",
			["<C-y>"] = "jump",
			["<cr>"] = "jump",
		}
	}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>tt",
			"<cmd>Trouble diagnostics<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>ti",
			"<cmd>Trouble diagnostics filter.buf=0 win = { type = split, position=right }<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
	},
}
