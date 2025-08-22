function Recording()
	local reg = vim.fn.reg_recording()
	if reg == "" then return "" end -- not recording
	return reg
end

return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local opts = {
			options = {
				icons_enabled = true,
				theme = 'auto',
			},
			sections = {
				lualine_a = {
					'mode'
				},
				lualine_b = {
					'branch',
					'diff',
					'diagnostics'
				},
				lualine_c = {
					'filename',
					{
						Recording,
						color = {
							bg = "#FF4365", fg = "#FFFFF3"
						}
					}
				},
				lualine_x = {
					'filetype'
				},
				lualine_y = {
					'progress',
				},
				lualine_z = {
					'location'
				}
			}
		}
		require('lualine').setup(opts)
	end
}
