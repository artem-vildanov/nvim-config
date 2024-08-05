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

-- only for windows
-- requires installed globaly typescript, @angular/language-server, @angular/language-service
local function setup_angularls(lspconfig)
  if require("../utils/get_os_name").get_os_name() ~= 'Windows' then
    return
  end

  local languageServerPath = "/Users/Artem/AppData/Roaming/npm/"
  local cmd = { "node", languageServerPath .. "/node_modules/@angular/language-server/index.js", "--stdio",
    "--tsProbeLocations", languageServerPath, "--ngProbeLocations", languageServerPath }

  lspconfig.angularls.setup {
    cmd = cmd,
    on_new_config = function(new_config, new_root_dir)
      new_config.cmd = cmd
    end,
  }
end

local nvim_lspconfig = {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({ capabilities = capabilities })
      end,
    })

    setup_angularls(lspconfig)
  end,
}

return {
  mason,
  mason_lspconfig,
  nvim_lspconfig,
}
