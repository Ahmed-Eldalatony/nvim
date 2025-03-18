return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" }, -- Required for async behavior
		event = "BufReadPost", -- Load plugin only when opening a file
		config = function()
			-- Prevent automatic folding when opening a file
			vim.o.foldenable = false -- Do not fold by default
			vim.o.foldlevel = 99 -- Keep all folds open
			vim.o.foldlevelstart = 99 -- Ensure folds start open
			vim.o.foldmethod = "expr" -- Use expression-based folding
			vim.o.foldexpr = "nvim_treesitter#foldexpr()" -- Use Treesitter for folding

			-- Load nvim-ufo
			require("ufo").setup({
				provider_selector = function(_, _, _)
					return { "treesitter", "indent" } -- Use Treesitter, fallback to indent
				end,
			})

			-- Keymaps for manual folding
			vim.keymap.set("n", "cr", require("ufo").openAllFolds) -- Open all folds
			vim.keymap.set("n", "cm", require("ufo").closeAllFolds) -- Close all folds
			vim.keymap.set("n", "ca", "za", { noremap = true, silent = true })
			vim.keymap.set("n", "K", function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end, { desc = "Peek fold or LSP hover" })
		end,
	},
}
