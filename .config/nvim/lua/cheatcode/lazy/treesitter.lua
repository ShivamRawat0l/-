return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"vimdoc", "javascript", "typescript", "c", "lua", "rust",
				"jsdoc", "bash",
			},
			sync_install = false,
			auto_install = true,
			indent = {
				enable = true
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},
			-- A list of parser names, or "all"
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "vv",
					node_incremental = "v",
					node_decremental = "V",
					scope_incremental = false,
				},
			},
		})

		local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		treesitter_parser_config.templ = {
			install_info = {
				url = "https://github.com/vrischmann/tree-sitter-templ.git",
				files = { "src/parser.c", "src/scanner.c" },
				branch = "master",
			},
		}
		vim.treesitter.language.register("templ", "templ")
	end
}
