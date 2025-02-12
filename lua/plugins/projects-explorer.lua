return{
  "coffebar/neovim-project",
  opts = {
    projects = { -- define project roots
      "~/dev/*",
      "~/.config/*",
      "~/Notes*",
    },
    picker = {
      type = "telescope", -- or "fzf-lua"
    }
  },
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    -- optional picker
    { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
    -- optional picker
    { "ibhagwan/fzf-lua" },
    { "Shatur/neovim-session-manager" },
  },

-- Keybindings for project commands
vim.keymap.set("n", "<Leader>fp", ":NeovimProjectHistory<CR>", { noremap = true, silent = true, desc = "Project history" }),
  -- not working now
-- vim.keymap.set("n", "<Leader>fl", ":NeovimProjectLoadRecent<CR>", { noremap = true, silent = true, desc = "Load recent project" }),
-- vim.keymap.set("n", "<Leader>fh", ":NeovimProjectLoadHist<CR>", { noremap = true, silent = true, desc = "Load project from history" }),
-- vim.keymap.set("n", "<Leader>pl", ":NeovimProjectLoad<CR>", { noremap = true, silent = true, desc = "Load project" }),

  lazy = false,
  priority = 100,
}
