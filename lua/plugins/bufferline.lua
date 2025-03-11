return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({})

		-- Function to switch buffers using Alt + Number
		for i = 1, 9 do
			vim.keymap.set("n", "<A-" .. i .. ">", function()
				vim.cmd("BufferLineGoToBuffer " .. i)
			end, { silent = true })

			-- Move between buffers using Tab / Shift+Tab
			vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
		end
	end,
}
