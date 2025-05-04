return {
  {
    "marko-cerovac/material.nvim",
    config = function()
      local material = require("material")
      local colors = require("material.colors")

      material.setup({
        custom_highlights = {
          CursorLine = { fg = colors.editor.contrast, underline = true },
          SpellBad = {
            undercurl = true,
            italic = true,
          },
          Comment = { italic = true, fg = colors.main.gray },
          -- Example: tab line customization
          TabLine = function(colors, _)
            return {
              fg = colors.main.gray,
              italic = true,
            }
          end,
          TabLineSel = function(_, highlights)
            return vim.tbl_extend(
              "force",
              highlights.main_highlights.editor()["TabLineSel"],
              { bold = true }
            )
          end,
        },

        custom_colors = function(colors)
          -- colors.editor.bg = "#1e1e2e"   -- Replace with your preferred background
          -- colors.main.purple = "#c678dd" -- Custom purple
          -- colors.lsp.error = "#ff6c6b"   -- LSP error color
        end,
      })

      -- Set the Material style
      vim.g.material_style = "deep ocean"

      -- Apply the colorscheme
      vim.cmd("colorscheme material")
    end
  }
}

-- return {
--   {
--     'kaicataldo/material.vim',
--     lazy = false,  -- Load immediately
--     priority = 1000, -- Ensures it loads before other plugins
--     config = function()
--        vim.g.material_theme_style="ocean"
--       vim.cmd([[colorscheme material]])
--     end,
--   },
-- }
