return
{
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls"},
            },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require('mappings.lspconfig_m')
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
      --  capabilities = capabilities,
      })
    end,
  }
}