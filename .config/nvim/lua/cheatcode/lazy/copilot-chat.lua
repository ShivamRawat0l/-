return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim", branch = "master" },
	},
	build = "make tiktoken",
	opts = {
		model = 'claude-sonnet-4', -- AI model to use
		temperature = 0.1,   -- Lower = focused, higher = creative
		window = {
			layout = 'vertical', -- 'vertical', 'horizontal', 'float'
			width = 0.5,     -- 50% of screen width
			row = 1,
			col = nil,
		},
		insert_at_end = true,
		chat_autocomplete = false,
		auto_insert_mode = true, -- See Configuration section for options
		mappings = {
			close = {
				normal = "<C-=>",
				insert = "<C-=>",
				callback = function()
					require("CopilotChat").close()
				end,
			},
			complete = {
				insert = '<Nop>',
				callback = function()
					require('CopilotChat.completion').complete()
				end,
			},
		}
	},
	config = function(_, opts)
		require("CopilotChat").setup(opts)
	end,
}
