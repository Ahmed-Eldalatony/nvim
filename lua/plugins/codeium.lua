return {
  "Exafunction/codeium.vim",
  event = "BufEnter",
  config = function()
    -- Keybindings for Codeium functionalities
    vim.keymap.set("i", "<C-g>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true, silent = true, desc = "Codeium Accept" })
    vim.keymap.set("i", "<C-x>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true, silent = true, desc = "Codeium Clear" })
    vim.keymap.set("i", "<C-]>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true, silent = true, desc = "Codeium Cycle Completions Next" })

    -- Disable Codeium for specific filetypes
    vim.g.codeium_filetypes = {
      markdown = false,
    }

    -- Create a user command to open Codeium Chat
    vim.api.nvim_create_user_command("CodeiumChat", function()
      vim.fn["codeium#Chat"]()
    end, { desc = "Open Codeium Chat" })

    -- Optional: Keybinding to trigger Codeium Chat
    vim.keymap.set("n", "<leader>cc", ":CodeiumChat<CR>", { silent = true, desc = "Open Codeium Chat" })
  end,
  filename = {
    ".zshrc",
    ".bashrc",
    ".bash_profile",
    ".profile",
    ".zshenv",
  },
}
