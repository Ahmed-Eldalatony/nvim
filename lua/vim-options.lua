-- Resets
vim.keymap.set("n", "s", "", { silent = true })
vim.keymap.set("i", "jk", "<Esc>", { silent = true, desc = "Go normal mode" })
vim.keymap.set("n", "j", "gj", { silent = true })
vim.keymap.set("n", "k", "gk", { silent = true })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })

-- General workflow
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>d", ":bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>D", ":bufdo bd<CR>", { silent = true, desc = "Close all buffers" })

vim.keymap.set("n", "<leader>q", ":qa!<CR>", { silent = true, desc = "Quit Neovim" })
vim.keymap.set("n", "<leader>q", ":qa!<CR>", { silent = true, desc = "Quit Neovim" })
vim.keymap.set("n", "sc", ":w<CR>", { silent = true, desc = "Save file" })
vim.keymap.set("n", "sa", ":wa<CR>", { silent = true, desc = "Save all files" })
-- vim.keymap.set("n", "ss", ":wqa!<CR>", { silent = true, desc = "Save all files" })

vim.keymap.set("n", "ss", function()
	vim.cmd("wa") -- Save all files
	vim.defer_fn(function()
		vim.cmd("qall!") -- Quit after a small delay
	end, 100) -- Delay in milliseconds (100ms = 0.1s)
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
vim.opt.fillchars:append({ eob = " " })

-- Neovim options
vim.opt.expandtab = true -- not sure
vim.opt.smartindent = true -- not sure
vim.opt.termguicolors = true -- not sure
vim.opt.wrap = false
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 20
vim.opt.clipboard = "unnamedplus"

-- Keybindings to toggle floating terminals by numbers (1-9)

-- vim.api.nvim_set_keymap("n", "<leader>" .. i, "<cmd>lua toggle_floating_terminal(" .. i .. ")<CR>", { noremap = true, silent = true })

-- vim.keymap.set("n", "<leader>i"..num,":ToggleTerm<CR>", { noremap = true, silent = true })
-- for i = 1, 3 do
--   vim.keymap.set("n", "<leader>i" .. i, ":ToggleTerm " .. i .. "<CR>", { noremap = true, silent = true })
--
--
-- end

local keys = { "a", "s", "d", "f" }

for i, key in ipairs(keys) do
	vim.keymap.set("n", "<M-" .. key .. ">", ":ToggleTerm " .. i .. "<CR>", { noremap = true, silent = true })
	-- Insert mode
	vim.keymap.set("i", "<M-" .. key .. ">", "<Esc>:ToggleTerm " .. i .. "<CR>", { noremap = true, silent = true })
	-- Terminal mode
	vim.keymap.set(
		"t",
		"<M-" .. key .. ">",
		"<C-\\><C-n>:ToggleTerm direction=float<CR>",
		{ noremap = true, silent = true }
	)
end

vim.o.guifont = "JetBrainsMono Nerd Font:h14"
vim.o.linespace = 4
