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
      ensure_installed = { "svelte" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()

      local on_attach = function(_, bufnr)
        local km = vim.keymap
        local opts = { buffer = bufnr }
        km.set("n", "K", vim.lsp.buf.hover, opts)
        km.set("n", "gd", vim.lsp.buf.definition, opts)
        km.set("n", "gr", vim.lsp.buf.references, opts)
        km.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end

      -- TypeScript
      lspconfig.ts_ls.setup({ capabilities = capabilities, on_attach = on_attach })

      -- Ruby
      lspconfig.solargraph.setup({ capabilities = capabilities, on_attach = on_attach })

      -- HTML
      lspconfig.html.setup({ capabilities = capabilities, on_attach = on_attach })

      -- Lua
      lspconfig.lua_ls.setup({ capabilities = capabilities, on_attach = on_attach })

      -- JSON Language Server w/ SchemaStore
      lspconfig.jsonls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })

      -- PHP
      lspconfig.intelephense.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "php", "blade", "blade.php" },
        settings = {
          intelephense = {
            files = { maxSize = 5000000 },
          },
        },
      })

      -- cSpell spell‑checker
      lspconfig.cspell.setup({
        on_attach = on_attach,
        settings = {
          cSpell = {
            enabled = true,
            language = "en",
            allowCompoundWords = true,
            enableFiletypes = { "javascript", "typescript", "markdown", "text", "python" },
          },
        },
        filetypes = { "javascript", "typescript", "markdown", "text", "python" },
      })

      -- Godot
      lspconfig.gdscript.setup({ capabilities = capabilities, on_attach = on_attach })

      -- **Svelte**
      -- mason‑lspconfig will install svelte‑language‑server (registry name "svelte"),
      -- and lspconfig recognizes the "svelte" key out‑of‑the‑box.
      lspconfig.svelte.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "svelte" },
        settings = {
          -- Note: change to true only if your Neovim version < 0.10
          workspace = { didChangeWatchedFiles = { enable = false } },
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("MyLspConfigs", {}),
        callback = on_attach,
      })
    end,
  },
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
}
