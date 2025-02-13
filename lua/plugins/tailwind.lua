return {
  "neovim/nvim-lspconfig",
  dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "tailwindcss" },
    })

    local lspconfig = require("lspconfig")
    lspconfig.tailwindcss.setup({})
  end,
}
