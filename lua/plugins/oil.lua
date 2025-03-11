return {
	"stevearc/oil.nvim",
	config = function()
		local oil = require("oil")
		oil.setup({
			keymaps = {
				["H"] = "actions.parent", -- Navigate to parent directory
				["L"] = "actions.select", -- Open directory or file
				["<C-h>"] = "actions.toggle_hidden", -- Toggle hidden files
			},
			float = {
				max_width = 52, -- Maximum width of the floating window
				max_height = 17, -- Maximum height of the floating window
			},
			default_file_explorer = true,
			view_options = {
				show_hidden = true, -- Show hidden files
				is_always_hidden = function(name, _)
					-- Add any specific files or directories you want to hide
					return false
				end,
			},
			-- Use `fd` or `ripgrep` to list files
			use_default_keymaps = true,
		})
		vim.keymap.set("n", "t", oil.toggle_float, {})
	end,
}
