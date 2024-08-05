return {
  'Pocco81/auto-save.nvim',
  config = function()
    require('auto-save').setup({
      enabled = true,                            -- Включение автосохранения
      events = { "InsertLeave", "TextChanged" }, -- События, при которых происходит автосохранение
      conditions = {
        exists = true,
        filename_is_not = {},
        filetype_is_not = {},
        modifiable = true
      },
      write_all_buffers = false, -- Сохранять только текущий буфер
      debounce_delay = 500       -- Задержка перед автосохранением (в мс)
    })
  end
}
