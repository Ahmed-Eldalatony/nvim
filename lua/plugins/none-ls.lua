return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup({
      sources = {
        -- Lua
        formatting.stylua,

        -- ✅ Prettierd: Svelte / JS / TS / etc.
        formatting.prettierd.with({
          filetypes = {
            "html",
            "json",
            "svelte",
            "markdown",
            "css",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "yaml",
            "scss",
          },
        }),

        -- Ruby
        diagnostics.erb_lint,
        diagnostics.rubocop,
        formatting.rubocop,

        -- PHP
        formatting.phpcsfixer,
      },

      -- Optional: restrict which filetypes this plugin activates on
      filetypes = {
        "php", "blade", "blade.php",
        "svelte", "javascript", "typescript",
        "gdscript", "godo_resources",
        "html", "css", "json", "markdown",
        "yaml", "scss"
      },

      -- Format on save
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })

    -- Manual format command
    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({ async = true })
    end, {})
  end,
}
