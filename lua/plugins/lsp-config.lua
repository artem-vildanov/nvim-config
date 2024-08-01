local mason = {
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup()
	end,
}

local mason_lspconfig = {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
			},
			automatic_installation = true,
		})
	end,
}

local nvim_lspconfig = {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		-- lspconfig.lua_ls.setup({})
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({ capabilities = capabilities })
			end,
		})
	end,
}

return {
	mason,
	mason_lspconfig,
	nvim_lspconfig,
}
