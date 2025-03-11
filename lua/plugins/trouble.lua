-- Lua
return {
	"folke/trouble.nvim",
	requires = "kyazdani42/nvim-web-devicons",
	config = function()
		require("trouble").setup()

		-- -- Toggle Trouble (default view, shows workspace diagnostics)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			{ silent = true, noremap = true, desc = "Toggle Trouble" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>td",
			"<cmd>Trouble diagnostics toggle focus=false filter.buf=0<CR>",
			{ noremap = true, silent = true }
		)
		--
		--
		-- Show workspace-wide diagnostics (all files)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>xw",
			"<cmd>TroubleToggle workspace_diagnostics<cr>",
			{ silent = true, noremap = true, desc = "Show workspace diagnostics" }
		)

		-- Show document diagnostics (current file only)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>xd",
			"<cmd>TroubleToggle document_diagnostics<cr>",
			{ silent = true, noremap = true, desc = "Show document diagnostics" }
		)

		-- Show location list (used by :lopen / :lclose, often used for errors in a single file)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>xl",
			"<cmd>TroubleToggle loclist<cr>",
			{ silent = true, noremap = true, desc = "Show location list" }
		)

		-- Show quickfix list (used by :copen / :cclose, common for grep results and build errors)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>xq",
			"<cmd>Trouble qflist toggle<cr>",
			{ silent = true, noremap = true, desc = "Show quickfix list" }
		)

		-- Show LSP references (when cursor is on a symbol, shows all references)
		vim.api.nvim_set_keymap(
			"n",
			"gR",
			"<cmd>TroubleToggle lsp_references<cr>",
			{ silent = true, noremap = true, desc = "Show LSP references" }
		)
	end,
}
