return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      -- local trouble = require("trouble.providers.telescope") -- seems like a wrong provider
      -- local themes = require("telescope.themes")

      -- Custom dropdown theme with large dimensions
      local dropdown_theme = require("telescope.themes").get_dropdown({
        layout_config = {
          width = 0.80,   -- Single width definition
          height = 0.70,  -- Single width definition
          preview_width = 0.4, -- Preview takes 60% of the width
          -- Corrected typo
          prompt_position = "top",
        },

        layout_strategy = "horizontal",
        winblend = 2, -- Slight transparency
      })
      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules" },
          hidden = true,
          mappings = {
            i = { ["<C-u>"] = false, ["<C-d>"] = false },
          },
        },
        extensions = {
          ["ui-select"] = dropdown_theme,
        },

        pickers = {
          find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          },
        },
      })

      -- Keymaps with dropdown theme applied
      vim.keymap.set("n", "<leader> ", function()
        builtin.find_files(dropdown_theme)
      end)

       vim.keymap.set({"n", "v"}, "<leader>fw", function()
         local word
         local mode = vim.fn.mode()
         if mode == 'v' or mode == 'V' then
           -- Get visual selection properly
           vim.cmd('normal! "xy')
           word = vim.fn.getreg('x')
         else
           -- Normal mode: get word under cursor
           word = vim.fn.expand("<cword>")
         end
         local opts = vim.tbl_extend("force", dropdown_theme, { default_text = word })
         builtin.live_grep(opts)
       end)

      vim.keymap.set("n", "<leader>o", function()
        builtin.oldfiles(dropdown_theme)
      end)

      vim.keymap.set("n", "<leader>b", function()
        builtin.buffers(dropdown_theme)
      end)

      vim.keymap.set("n", "<leader>fk", function()
        builtin.keymaps(dropdown_theme)
      end)

      vim.keymap.set("n", "<leader>fc", function()
        builtin.commands(dropdown_theme)
      end)

      vim.keymap.set("n", "<leader>fn", function()
        local opts = vim.tbl_extend("force", dropdown_theme, {
          symbols = { "function", "method", "class", "interface", "struct" }
        })
        builtin.lsp_document_symbols(opts)
      end)

       vim.keymap.set("n", "<leader>gf", function()
         builtin.git_files(dropdown_theme)
       end)

         vim.keymap.set("n", "<leader>fr", function()
          -- Check if any LSP client is attached to current buffer
          local clients = vim.lsp.get_active_clients({ bufnr = 0 })
          if #clients == 0 then
            -- Try to start LSP for current buffer
            local bufnr = vim.api.nvim_get_current_buf()
            local filetype = vim.bo[bufnr].filetype
            
            -- Try to attach using vim.lsp.start which uses the configs from vim.lsp.config
            local client_id = vim.lsp.start({
              name = filetype .. "_lsp",
              cmd = nil, -- Will use the config set via vim.lsp.config
              root_dir = vim.fs.root(bufnr, { '.git', 'package.json', 'Gemfile', 'composer.json' }),
            })
            
            if client_id then
              vim.notify("Starting LSP for " .. filetype .. "...", vim.log.levels.INFO)
              -- Wait a moment for LSP to initialize
              vim.defer_fn(function()
                local new_clients = vim.lsp.get_active_clients({ bufnr = bufnr })
                if #new_clients > 0 then
                  builtin.lsp_references(dropdown_theme)
                else
                  vim.notify("LSP failed to attach. You may need to install the language server.", vim.log.levels.WARN)
                end
              end, 500)
            else
              vim.notify("Could not start LSP for filetype: " .. filetype, vim.log.levels.WARN)
            end
            return
          end
          builtin.lsp_references(dropdown_theme)
        end)

       telescope.load_extension("ui-select")
    end,
  },
}
