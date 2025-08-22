function ColorMyPencils(theme)
	theme = "everforest"
	vim.cmd.colorscheme(theme)

	if false then
		local color = "#000000"
		--vim.api.nvim_set_hl(0, "Visual", { bg = "#264f78" });
		vim.api.nvim_set_hl(0, "TroubleNormal", { bg = color });
		--vim.api.nvim_set_hl(0, "DiagnosticVirtualText", { bg = color });
		--vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = color });
		--vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = color });
		--vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = color });
		--vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = color });
		vim.api.nvim_set_hl(0, "Normal", { bg = color }); -- this is the background color of the editor
		vim.api.nvim_set_hl(0, "Winbar", { bg = color }); -- this is the background color of the editor
		vim.api.nvim_set_hl(0, "WinbarNC", { bg = color }); -- this is the background color of the editor
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = color })
		vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#020401" });
		vim.api.nvim_set_hl(0, "NormalNC", { bg = color });
		vim.api.nvim_set_hl(0, "SignColumn", { bg = color });
		vim.api.nvim_set_hl(0, "StatusLine", { bg = color, });
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = color });
		--vim.api.nvim_set_hl(0, "ColorColumn", { bg = color });
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = color, link = "Normal" });
		vim.api.nvim_set_hl(0, "Float", { bg = color });
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = color });
		vim.api.nvim_set_hl(0, "Pmenu", { bg = color });
		--vim.api.nvim_set_hl(0, "PmenuSel", { bg = color }); -- this is the background color of the selected item in the popup menu
		--
		vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = color });
		vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = color });
		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = color });
		vim.api.nvim_set_hl(0, "CmpDocumentationBorder", { bg = color });
		vim.api.nvim_set_hl(0, "CmpDocumentation", { bg = color });
		vim.api.nvim_set_hl(0, "LineNr", { bg = color });
		vim.api.nvim_set_hl(0, "CursorLineNr", { bg = color });
		--vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#000000" });
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = color });
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = color });
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = color });
		--vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = "#fff000" });
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = color });
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = color });
		vim.api.nvim_set_hl(0, "TelescopeMatching", { bg = "#10221f" });
		vim.api.nvim_set_hl(0, "MiniFilesBorder", { bg = color });
		vim.api.nvim_set_hl(0, "MiniFilesNormal", { bg = color });
		vim.api.nvim_set_hl(0, "VertSplit", { bg = color });
		vim.api.nvim_set_hl(0, "ScrollbarSlider", { bg = color });
		vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = color });
		vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = color });
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = color });
		vim.api.nvim_set_hl(0, "MsgArea", { bg = color });
	end
end

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		enabled = false
	},
	{ "EdenEast/nightfox.nvim", enabled = false },
	{
		'glepnir/zephyr-nvim',
		name = 'zephyr',
		lazy = false,
		priority = 1000,
		enabled = true
	},
	{
		'AlexvZyl/nordic.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('nordic').load()
		end
	},
	{
		'uloco/bluloco.nvim',
		lazy = false,
		priority = 1000,
		dependencies = { 'rktjmp/lush.nvim' },
		config = function()
			-- your optional config goes here, see below.
		end,
		enabled = false
	},
	{
		"sho-87/kanagawa-paper.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		enabled = false
	},
	{
		"navarasu/onedark.nvim",
		name = "onedark",
		enabled = false,
		config = function()
			require("onedark").setup({
				style = "darker",
				lualine = {
					transparent = true,
				},
				highlights = {}
			})
			require("onedark").load()
		end
	},
	{
		"neanias/everforest-nvim",
		name = "everforestz",
		priority = 1000,
		lazy = false,
		version = false,
		config = function()
			local everforest = require("everforest")
			everforest.setup({
				transparent_background_level = 0,
				italics = true,
				disable_italic_comments = false,
				inlay_hints_background = "dimmed",
				background = "hard",
				on_highlights = function(hl, _)
					hl["@string.special.symbol.ruby"] = { link = "@field" }
				end,
				--colours_override = function(palette)
				--	if vim.o.background == "dark" then
				--		palette.bg0 = "#000000"
				--	end
				--end
			})
		end,
	},
}
