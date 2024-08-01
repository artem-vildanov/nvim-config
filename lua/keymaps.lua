local set_keymap = function(keybinding, action)
	vim.keymap.set("n", keybinding, action, {})
end

local function set_telescope_keymaps()
	local builtin = require("telescope.builtin")
	set_keymap("<leader>ff", builtin.find_files)
	set_keymap("<leader>fw", builtin.live_grep)
end

local function set_lsp_keymaps()
	set_keymap("<C-k>", vim.lsp.buf.signature_help)
	set_keymap("<leader>f", vim.lsp.buf.format)
end

local function set_lsp_saga_keymaps()
	set_keymap("d.", ":Lspsaga diagnostic_jump_next<CR>")
	set_keymap("d,", ":Lspsaga diagnostic_jump_prev<CR>")
	set_keymap("gd", ":Lspsaga goto_type_definition<CR>")
	set_keymap("<leader>fi", ":Lspsaga finder imp<CR>")
	set_keymap("<leader>fr", ":Lspsaga finder ref<CR>")
	set_keymap("<leader>f", ":Lspsaga finder<CR>")
	set_keymap("<leader>rw", ":Lspsaga rename<CR>")
	set_keymap("<leader>ca", ":Lspsaga code_action<CR>")
	set_keymap("K", ":Lspsaga hover_doc<CR>")
	set_keymap("<leader>d", ":Lspsaga show_line_diagnostics<CR>")
	set_keymap("<leader>db", ":Lspsaga show_buf_diagnostics<CR>")
end

local function set_neotree_keymaps()
	set_keymap("<leader>e", ":Neotree filesystem<CR>")
	set_keymap("<leader>b", ":Neotree buffers<CR>")
end

local function set_nvim_keymaps()
	set_keymap("<leader>s", ":w<CR>")
	set_keymap("<leader>sa", ":wa<CR>")
	set_keymap("<leader>Q", ":wqa!<CR>")
	set_keymap("<leader>q", ":q<CR>")
	set_keymap("<C-h>", "<C-w>h")
	set_keymap("<C-j>", "<C-w>j")
	set_keymap("<C-k>", "<C-w>k")
	set_keymap("<C-l>", "<C-w>l")
end

local function set_barbar_keymaps()
	-- Move to previous/next
	set_keymap("<A-,>", "<Cmd>BufferPrevious<CR>")
	set_keymap("<A-.>", "<Cmd>BufferNext<CR>")

	-- Re-order to previous/next
	set_keymap("<A-<>", "<Cmd>BufferMovePrevious<CR>")
	set_keymap("<A->>", "<Cmd>BufferMoveNext<CR>")
	set_keymap("<A-1>", "<Cmd>BufferGoto 1<CR>")
	set_keymap("<A-2>", "<Cmd>BufferGoto 2<CR>")
	set_keymap("<A-3>", "<Cmd>BufferGoto 3<CR>")
	set_keymap("<A-4>", "<Cmd>BufferGoto 4<CR>")
	set_keymap("<A-5>", "<Cmd>BufferGoto 5<CR>")
	set_keymap("<A-6>", "<Cmd>BufferGoto 6<CR>")
	set_keymap("<A-7>", "<Cmd>BufferGoto 7<CR>")
	set_keymap("<A-8>", "<Cmd>BufferGoto 8<CR>")
	set_keymap("<A-9>", "<Cmd>BufferGoto 9<CR>")
	set_keymap("<A-0>", "<Cmd>BufferLast<CR>")

	-- Pin/unpin buffer
	set_keymap("<A-p>", "<Cmd>BufferPin<CR>")

	-- Close buffer
	set_keymap("<A-c>", "<Cmd>BufferClose<CR>")

	-- Magic buffer-picking mode
	set_keymap("<C-p>", "<Cmd>BufferPick<CR>")
end

local set_formatting_keymaps = function()
	local conform = require("conform")
	vim.keymap.set({ "n", "v" }, "<leader>mp", function()
		conform.format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		})
	end, { desc = "Format file or range (in visual mode)" })
end

return {
	setup = function()
		set_telescope_keymaps()
		set_lsp_keymaps()
		set_neotree_keymaps()
		set_nvim_keymaps()
		set_barbar_keymaps()
		set_lsp_saga_keymaps()
		set_formatting_keymaps()
	end,
}
