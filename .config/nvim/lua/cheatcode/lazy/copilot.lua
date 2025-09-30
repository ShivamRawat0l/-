return {
	'zbirenbaum/copilot.lua',
	cmd = 'Copilot',
	event = 'InsertEnter',
	config = function()
		require("copilot").setup({
			panel = {
				enabled = true,
				auto_refresh = false,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-CR>"
				},
				layout = {
					position = "bottom", -- | top | left | right
					ratio = 0.4
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 50,
				keymap = {
					accept = "<M-l>", -- Alt+l as fallback
					accept_word = false,
					accept_line = false,
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				["*"] = true,
			},
			should_attach = function(_, bufname)
				if string.match(bufname, "env") then
					return false
				end

				return true
			end,
			copilot_node_command = 'node', -- Node.js version must be > 18.x
			server_opts_overrides = {},
		})
	end,
}
