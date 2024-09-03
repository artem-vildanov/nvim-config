return {
  "akinsho/nvim-toggleterm.lua",
  config = function()
    require("toggleterm").setup{
      -- здесь вы можете указать свои настройки
      size = 20, -- размер терминала
      open_mapping = [[<c-\>]], -- горячая клавиша для открытия терминала
      hide_numbers = true, -- скрывать номер строки
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = 'horizontal', -- направление терминала ('horizontal', 'vertical', 'float')
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        winblend = 3,
      },
    }
  end
}
