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

      telescope.setup({
        defaults = {
          mappings = {
            i = { ["<C-u>"] = false, ["<C-d>"] = false },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      -- Keymaps
      vim.keymap.set("n", "<leader> ", builtin.find_files, {})              -- Find files
      vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})              -- Live grep
      vim.keymap.set("n", "<leader>o", builtin.oldfiles, {})                -- Recent files
      vim.keymap.set("n", "<leader>b", builtin.buffers, {})                 -- Search buffers
      -- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {}) -- Help tags
      vim.keymap.set("n", "<leader>fw", builtin.current_buffer_fuzzy_find, {}) -- Search inside current buffer
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})                -- List keymaps
      vim.keymap.set("n", "<leader>fc", builtin.commands, {})               -- List commands
      vim.keymap.set("n", "<leader>gf", builtin.git_files, {})              -- Git files (if in repo)

      -- Load extensions
      telescope.load_extension("ui-select")
    end,
  },
}
