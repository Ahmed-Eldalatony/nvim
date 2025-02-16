return {
  "rmagatti/auto-session",
  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { "<leader>fs", "<cmd>SessionSearch<CR>",         desc = "Session search" },
    { "<leader>ss", "<cmd>SessionSave<CR>",           desc = "Save session" },
    { "<leader>wa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
  },
  config = function()
    -- Set session options for better session management
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

    -- Configure auto-session
    require("auto-session").setup({
      mappings = {
        -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
        delete_session = { "i", "<C-D>" },
        alternate_session = { "i", "<C-S>" },
        copy_session = { "i", "<C-Y>" },
      },

      session_control = {
        control_dir = vim.fn.stdpath("data") .. "/auto_session/", -- Auto session control dir, for control files, like alternating between two sessions with session-lens
        control_filename = "session_control.json",            -- File name of the session control file
      },
    })
  end,
}
