
local setup_windows_options = function()
  if require("get_os_name").get_os_name() ~= 'Windows' then
    return
  end

  vim.cmd("set linespace=8")
  vim.cmd("set guifont=JetBrainsMono\\ Nerd\\ Font\\ Propo:h10")
end

local setup_options = function()
  vim.cmd("set expandtab")
  vim.cmd("set tabstop=2")
  vim.cmd("set softtabstop=2")
  vim.cmd("set shiftwidth=2")
  vim.cmd("set relativenumber")
  vim.g.mapleader = " "
  setup_windows_options()
end

return {
  setup = function()
    setup_options()
  end,
}
