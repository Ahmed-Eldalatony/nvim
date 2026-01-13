return {
  "MagicDuck/grug-far.nvim",
  --- Ensure existing keymaps and opts remain unaffected
  config = function(_, opts)
    require("grug-far").setup(opts)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "grug-far",
      callback = function()
        -- Map <Esc> to quit after ensuring we're in normal mode
        vim.keymap.set({ "i", "n" }, "<Esc>", "<Cmd>stopinsert | bd!<CR>", { buffer = true })
      end,
    })
  end,
  keys = {
    {
      "<leader>sr",
      function()
        local grug = require("grug-far")
        local prefills = {
          paths = vim.fn.expand("%"),
        }
        if vim.fn.mode() == 'v' or vim.fn.mode() == 'V' then
          -- Get visual selection
          local start_pos = vim.fn.getpos("'<")
          local end_pos = vim.fn.getpos("'>")
          local lines = vim.api.nvim_buf_get_text(0, start_pos[2]-1, start_pos[3]-1, end_pos[2]-1, end_pos[3], {})
          prefills.search = table.concat(lines, '\n')
        end
        grug.open({
          transient = true,
          prefills = prefills,
        })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace",
    },
    {
      "<leader>gr",
      function()
        local grug = require("grug-far")
        local prefills = {}
        if vim.fn.mode() == 'v' or vim.fn.mode() == 'V' then
          -- Get visual selection
          local start_pos = vim.fn.getpos("'<")
          local end_pos = vim.fn.getpos("'>")
          local lines = vim.api.nvim_buf_get_text(0, start_pos[2]-1, start_pos[3]-1, end_pos[2]-1, end_pos[3], {})
          prefills.search = table.concat(lines, '\n')
        end
        grug.open({
          transient = true,
          prefills = prefills,
        })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace (Global)",
    },
    -- {
    --   "<leader>fw",
    --   function()
    --     local grug = require("grug-far")
    --     local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
    --     local prefills = {
    --       filesFilter = ext and ext ~= "" and "*." .. ext or nil,
    --     }
    --     if vim.fn.mode() == 'v' or vim.fn.mode() == 'V' then
    --       -- Get visual selection
    --       local start_pos = vim.fn.getpos("'<")
    --       local end_pos = vim.fn.getpos("'>")
    --       local lines = vim.api.nvim_buf_get_text(0, start_pos[2]-1, start_pos[3]-1, end_pos[2]-1, end_pos[3], {})
    --       prefills.search = table.concat(lines, '\n')
    --     end
    --     grug.open({
    --       transient = true,
    --       prefills = prefills,
    --     })
    --   end,
    --   mode = { "n", "v" },
    --   desc = "Search Word",
    -- },
  },
}
