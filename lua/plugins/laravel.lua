-- return {
-- 	"adalessa/laravel.nvim",
-- 	dependencies = {
-- 		"tpope/vim-dotenv",
-- 		"nvim-telescope/telescope.nvim",
-- 		"MunifTanjim/nui.nvim",
-- 		"kevinhwang91/promise-async",
-- 	},
-- 	cmd = { "Laravel" },
-- 	keys = {
-- 		{ "<leader>la", ":Laravel artisan<cr>" },
-- 		{ "<leader>lr", ":Laravel routes<cr>" },
-- 		{ "<leader>lm", ":Laravel related<cr>" },
-- 	},
-- 	event = { "VeryLazy" },
-- 	opts = {},
-- 	config = true,
-- }
return {
	{
		"jwalton512/vim-blade",
		ft = { "blade" },
	},

	{
		"adalessa/laravel.nvim",
		dependencies = {
			"tpope/vim-dotenv",
			"nvim-telescope/telescope.nvim",
			"MunifTanjim/nui.nvim",
			"kevinhwang91/promise-async",
		},
		cmd = { "Laravel" },
		event = { "VeryLazy" },
		opts = {},
		config = true,
	},
}
