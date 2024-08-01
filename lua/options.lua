local setup_options = function()
	vim.cmd("set expandtab")
	vim.cmd("set tabstop=2")
	vim.cmd("set softtabstop=2")
	vim.cmd("set shiftwidth=2")
	vim.cmd("set relativenumber")
	vim.cmd("set linespace=9")
	vim.g.mapleader = " "
end

return {
	setup = function()
		setup_options()
	end,
}
