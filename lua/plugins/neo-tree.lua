return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Set <Ctrl-e> to toggle Neo-tree
   vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", { noremap = true, silent = true })

   vim.keymap.set("n", "<leader>gs", ":Neotree float git_status<CR>", { noremap = true, silent = true })
    require("neo-tree").setup({
      window = {
        width=28,
        mappings = {
          ["h"] = "close_node",      -- Collapse directories
          ["l"] = "open",            -- Expand directories or open files
          ["C"] = "close_all_nodes", -- Collapse all directories
        },
      },
    })
  end,
}

