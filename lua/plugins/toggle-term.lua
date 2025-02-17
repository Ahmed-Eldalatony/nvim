return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 50,
			open_mapping = [[<M-i>]], -- Alt + i to toggle
			shade_terminals = true,
			direction = "float", -- options: 'horizontal', 'vertical', 'float', 'tab'
			float_opts = {
				border = "curved", -- options: 'single', 'double', 'curved', etc.
				width = 100,
				height = 40,
			},
		})
	end,
}
