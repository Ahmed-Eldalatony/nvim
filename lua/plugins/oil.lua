-- return {
--   "stevearc/oil.nvim",
--   config = function()
--     local oil = require("oil")
--     oil.setup()
--     vim.keymap.set("n", "t", oil.toggle_float, {})
--   end,
-- }
--
--
return {
	"stevearc/oil.nvim",
	config = function()
		local oil = require("oil")
		oil.setup({
			keymaps = {
				["H"] = "actions.parent", -- Navigate to parent directory
				["L"] = "actions.select", -- Open directory or file
			},
			float = {
				max_width = 50, -- Maximum width of the floating window
				max_height = 15, -- Maximum height of the floating window
			},
		})
		vim.keymap.set("n", "t", oil.toggle_float, {})
	end,
}
