return {
    'norcalli/nvim-colorizer.lua',
    config = function()
        require('colorizer').setup({
          '*', -- Highlight all filetypes by default
          html = {  -- Customize highlighting for HTML specifically
            mode = 'foreground' -- Use foreground highlighting
          }
        })
      end,
}