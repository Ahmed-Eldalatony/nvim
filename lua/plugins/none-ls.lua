return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.biome.with({
          filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
          args = {
            'check',
            '--write',
            '--unsafe',
            '--formatter-enabled=true',
            '--organize-imports-enabled=true',
            '--skip-errors',
            '--use-server',
            '--stdin-file-path=$FILENAME',
          },
        }),
        null_ls.builtins.diagnostics.erb_lint,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.formatting.phpcsfixer,
      },
      filetypes = { "php", "blade", "blade.php" },
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

    -- Manual format keymap
    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({ async = true })
    end, {})
  end,
}
