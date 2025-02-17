return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- TypeScript
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      -- Ruby
      lspconfig.solargraph.setup({
        capabilities = capabilities,
      })

      -- HTML
      lspconfig.html.setup({
        capabilities = capabilities,
      })

      -- Lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- JSON Language Server (jsonls) with SchemaStore
      lspconfig.jsonls.setup({
        capabilities = capabilities,
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(), -- Auto-fetch schemas
            validate = { enable = true },
          },
        },
      })

      -- Keybindings
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
  -- SchemaStore for JSON schema support
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
}
