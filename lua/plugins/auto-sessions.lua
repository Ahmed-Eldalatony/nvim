return {
  "rmagatti/auto-session",
   keys = {
     -- Will use Telescope if installed or a vim.ui.select picker otherwise
     { "<leader>fs", "<cmd>AutoSession search<CR>",         desc = "Session search" },
     { "<leader>ss", "<cmd>AutoSession save<CR>",           desc = "Save session" },
     { "<leader>wa", "<cmd>AutoSession toggle-autosave<CR>", desc = "Toggle autosave" },
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

    -- Re-attach LSPs to all buffers after session restore using autocmd
    vim.api.nvim_create_autocmd("SessionLoadPost", {
      group = vim.api.nvim_create_augroup("AutoSessionLSP", { clear = true }),
      callback = function()
        -- Give a moment for buffers to fully load
        vim.defer_fn(function()
          local buffers = vim.api.nvim_list_bufs()
          local attached_count = 0

          for _, bufnr in ipairs(buffers) do
            if vim.api.nvim_buf_is_valid(bufnr) and vim.api.nvim_buf_is_loaded(bufnr) then
              local filetype = vim.bo[bufnr].filetype
              
              if filetype and filetype ~= "" then
                local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
                
                if #clients == 0 then
                  -- Try to enable LSP for this filetype using vim.lsp.enable
                  local ok, _ = pcall(function()
                    vim.lsp.enable(filetype .. "_lsp")
                  end)
                  
                  -- Also try vim.lsp.start as backup
                  if not ok then
                    pcall(function()
                      vim.lsp.start({
                        name = filetype .. "_lsp",
                        root_dir = vim.fs.root(bufnr, { '.git', 'package.json', 'Gemfile', 'composer.json', 'tsconfig.json' }),
                      }, { bufnr = bufnr })
                    end)
                  end
                  
                  attached_count = attached_count + 1
                end
              end
            end
          end

          if attached_count > 0 then
            vim.notify("Re-attached LSP to " .. attached_count .. " buffer(s)", vim.log.levels.INFO)
          end
        end, 100)
      end,
    })
  end,
}
