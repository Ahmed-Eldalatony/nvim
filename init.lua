local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
require("vim-options")
require("scripts")
require("lazy").setup("plugins")

-- Create or get the autocommand group
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local my_group = augroup("MyCustomMappings", { clear = true })
