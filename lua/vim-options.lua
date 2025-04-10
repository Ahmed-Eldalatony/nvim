-- Resets
vim.keymap.set("n", "s", "", { silent = true })
vim.keymap.set("i", "jk", "<Esc>", { silent = true, desc = "Go normal mode" })
vim.keymap.set("n", "j", "gj", { silent = true })
vim.keymap.set("n", "k", "gk", { silent = true })
vim.keymap.set("t", "<A-c>", "<C-\\><C-n>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<c-w>", "")

-- General workflow
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>d", ":bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>D", ":bufdo bd<CR>", { silent = true, desc = "Close all buffers" })
--
-- Navigate vim panes better

vim.keymap.set("n", "<leader>q", ":qa!<CR>", { silent = true, desc = "Quit Neovim" })
vim.keymap.set("n", "sc", ":w<CR>", { silent = true, desc = "Save file" })
vim.keymap.set("n", "S", ":wa<CR>", { silent = true, desc = "Save afiles" })

vim.keymap.set("n", "<leader>ss", function()
  vim.cmd("wa")      -- Save all files
  vim.defer_fn(function()
    vim.cmd("qall!") -- Quit after a small delay
  end, 100)          -- Delay in milliseconds (100ms = 0.1s)
end, { noremap = true, silent = true })

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
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.wo.number = true

vim.api.nvim_set_keymap("n", "<C-c>", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-v>", '"+p', { noremap = true, silent = true })
vim.opt.fillchars:append({ eob = " " })

-- Neovim options
vim.opt.expandtab = true     -- not sure
vim.opt.smartindent = true   -- not sure
vim.opt.termguicolors = true -- not sure
vim.opt.wrap = false
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 20

vim.opt.guifont = "Operator Mono Lig:h16.4"
vim.o.linespace = 4

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.sessionoptions = { "blank", "curdir", "folds", "help", "winsize", "winpos" }

-- Map 'nf' to ']m' to move to the next function
vim.api.nvim_set_keymap("n", "nf", "]m", { noremap = true, silent = true })

-- Map 'bf' to '[m' to move to the previous function
vim.api.nvim_set_keymap("n", "bf", "[m", { noremap = true, silent = true })
vim.opt.clipboard = "unnamedplus"
vim.api.nvim_create_autocmd("WinEnter", { command = "set nowinfixbuf" })
vim.opt.scrollback = 1000
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true, desc = "Quit search highlgiht" })
