vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "dark"
-- vim.keymap.del("n", "<C-w>")

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
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

-- Move between buffers using Tab / Shift+Tab
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true }) 
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true }) 

-- Close the current buffer using Ctrl+w
vim.keymap.set("n", "<leader>d",":bdelete<CR>", { noremap = true, silent = true }) 

vim.keymap.set("n", "<leader>da", ":bufdo bd<CR>", { silent = true, desc = "Close all buffers" })

vim.keymap.set("n", "<leader>q", ":qa<CR>", { silent = true, desc = "Quit Neovim" })

