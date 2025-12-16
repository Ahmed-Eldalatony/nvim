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
      vim.lsp.config('ts_ls', { capabilities = capabilities, on_attach = on_attach })
      vim.lsp.enable('ts_ls')

      -- Ruby
      vim.lsp.config('solargraph', { capabilities = capabilities, on_attach = on_attach })
      vim.lsp.enable('solargraph')

      -- HTML
      vim.lsp.config('html', { capabilities = capabilities, on_attach = on_attach })
      vim.lsp.enable('html')

      -- Lua
      vim.lsp.config('lua_ls', { capabilities = capabilities, on_attach = on_attach })
      vim.lsp.enable('lua_ls')

      -- JSON Language Server w/ SchemaStore
      vim.lsp.config('jsonls', {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })
      vim.lsp.enable('jsonls')

      -- PHP
      vim.lsp.config('intelephense', {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "php", "blade", "blade.php" },
        settings = {
          intelephense = {
            files = { maxSize = 5000000 },
          },
        },
      })
      vim.lsp.enable('intelephense')

      -- cSpell spell‑checker
      vim.lsp.config('cspell', {
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
      vim.lsp.enable('cspell')

      -- Godot
      vim.lsp.config('gdscript', { capabilities = capabilities, on_attach = on_attach })
      vim.lsp.enable('gdscript')

      -- **Svelte**
      -- mason‑lspconfig will install svelte‑language‑server (registry name "svelte"),
      -- and lspconfig recognizes the "svelte" key out‑of‑the‑box.
      vim.lsp.config('svelte', {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "svelte" },
        settings = {
          -- Note: change to true only if your Neovim version < 0.10
          workspace = { didChangeWatchedFiles = { enable = false } },
        },
      })
      vim.lsp.enable('svelte')

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
