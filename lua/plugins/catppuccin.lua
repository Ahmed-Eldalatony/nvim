-- return {
--   -- {
--   --   "catppuccin/nvim",
--   --   lazy = false,
--   --   name = "catppuccin",
--   --   priority = 1000,
--   --   config = function()
--   --     vim.cmd.colorscheme "catppuccin-mocha"
--   --   end
--   -- }
-- --   {
-- --     "marko-cerovac/material.nvim",
-- --     -- priority = 1000,
-- --     config = function()
-- --         -- Set the Material style before applying the theme
-- --         vim.g.material_style = "deep ocean" -- Use "deep ocean" style
-- --
-- --         -- Load and configure Material theme
-- --         require('material').setup({
-- --             -- contrast = true, -- Enable darker background
-- --             -- borders = true, -- Enable window borders
-- --     --     contrast = {
-- --     --     terminal = true, -- Enable contrast for the built-in terminal
-- --     --     sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
-- --     --     floating_windows = true, -- Enable contrast for floating windows
-- --     --     cursor_line = false, -- Enable darker background for the cursor line
-- --     --     lsp_virtual_text = false, -- Enable contrasted background for lsp virtual text
-- --     --     non_current_windows = false, -- Enable contrasted background for non-current windows
-- --     --     filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
-- --     -- },
-- --         })
-- --         -- Apply the theme
-- --         vim.cmd("colorscheme material")
-- --     end
-- -- }
-- }

return {
  {
    'kaicataldo/material.vim',
    lazy = false,  -- Load immediately
    priority = 1000, -- Ensures it loads before other plugins
    config = function()
       vim.g.material_theme_style="ocean"
      vim.cmd([[colorscheme material]])
    end,
  },
}
