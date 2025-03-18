return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "│" },
      scope = { enabled = false },
      exclude = { filetypes = { "dashboard", "mason", "lazy", "neo-tree", "lspsagaoutline", "aerial" } },
    },
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "│",
      draw = {
        animation = function()
          return 0 -- disable animation
        end,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.opt.list = true
    end,
  },
}
