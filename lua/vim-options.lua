-- Resets
vim.keymap.set("n", "s", "", { silent = true })
vim.keymap.set("i", "jk", "<Esc>", { silent = true, desc = "Go normal mode"})
vim.keymap.set("n", "j", "gj", { silent = true })
vim.keymap.set("n", "k", "gk", { silent = true })

-- General workflow 
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>dc", ":bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>da", ":bufdo bd<CR>", { silent = true, desc = "Close all buffers" })

vim.keymap.set("n", "<leader>q", ":qa<CR>", { silent = true, desc = "Quit Neovim" })
vim.keymap.set("n", "s", ":w<CR>", { silent = true, desc = "Save file" })
vim.keymap.set("n", "<leader>sa", ":wa<CR>", { silent = true, desc = "Save all files" })

vim.keymap.set("n", "<A-w>", ":set wrap!<CR>", { silent = true, desc = "Toggle line wrap" })

-- Default  options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.background = "dark"
-- vim.keymap.del("n", "<C-w>")

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.wo.number = true

vim.api.nvim_set_keymap('n', '<C-c>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })
vim.opt.fillchars:append { eob = " " }

-- Neovim options
vim.opt.expandtab = true-- not sure
vim.opt.smartindent = true -- not sure
vim.opt.termguicolors = true  -- not sure
vim.opt.wrap = false
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 20
vim.opt.clipboard = "unnamedplus"

