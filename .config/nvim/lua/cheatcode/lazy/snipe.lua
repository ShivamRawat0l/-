return {
	"leath-dub/snipe.nvim",
	keys = {
		{ "<leader><leader>", function() require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu" }
	},
	opts = {
		ui = {
			position = "cursor",

			open_win_override = {
				title = "",
				border = "solid",
			},
			text_align = "file-first",
			preselect_current = true,
		},
		navigate = {
			under_cursor = ";",
			open_vsplit = "<C-v>",
			change_tag = "C",
		},
		sort = "last"
	}
}
