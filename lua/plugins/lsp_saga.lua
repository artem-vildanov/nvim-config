return {
  'glepnir/lspsaga.nvim',
  branch = 'main',
  config = function()
    require('lspsaga').setup({
      lightbulb = {
        enable = false, -- Disable the lightbulb feature
        sign = false,   -- Disable the sign column lightbulb
        virtual_text = false, -- Disable virtual text lightbulb
      }
    })
  end
}
