return {
  "rachartier/tiny-code-action.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    -- optional picker via telescope
    { "nvim-telescope/telescope.nvim" },
    -- optional picker via fzf-lua
    { "ibhagwan/fzf-lua" },
    {
      "folke/snacks.nvim",
      opts = {
        terminal = {},

      }
    }
  },
  event = "LspAttach",
  picker = {
    "buffer",
    opts = {
      hotkeys = true,
    }
  },
  opts = {
    picker = "telescope", -- your config
  },
}
