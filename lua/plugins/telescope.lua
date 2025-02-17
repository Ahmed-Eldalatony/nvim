return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			-- local trouble = require("trouble.providers.telescope") -- seems like a wrong provider
			-- local themes = require("telescope.themes")

			-- Custom dropdown theme with large dimensions
			local dropdown_theme = require("telescope.themes").get_dropdown({
				layout_config = {
					width = 0.80, -- Single width definition
					height = 0.70, -- Single width definition
					preview_width = 0.6, -- Preview takes 60% of the width
					-- Corrected typo
					prompt_position = "top",
				},

				layout_strategy = "horizontal",
				winblend = 2, -- Slight transparency
			})
			telescope.setup({
				defaults = {
					file_ignore_patterns = { "node_modules", ".git" },
					mappings = {
						-- i = { ["<c-t>"] = trouble.open_with_trouble },
						-- n = { ["<c-t>"] = trouble.open_with_trouble },
						i = { ["<C-u>"] = false, ["<C-d>"] = false },
					},
				},
				extensions = {
					["ui-select"] = dropdown_theme,
				},
			})

			-- Keymaps with dropdown theme applied
			vim.keymap.set("n", "<leader> ", function()
				builtin.find_files(dropdown_theme)
			end)

			vim.keymap.set("n", "<leader>fw", function()
				builtin.live_grep(dropdown_theme)
			end)

			vim.keymap.set("n", "<leader>o", function()
				builtin.oldfiles(dropdown_theme)
			end)

			vim.keymap.set("n", "<leader>b", function()
				builtin.buffers(dropdown_theme)
			end)

			vim.keymap.set("n", "<leader>fk", function()
				builtin.keymaps(dropdown_theme)
			end)

			vim.keymap.set("n", "<leader>fc", function()
				builtin.commands(dropdown_theme)
			end)

			vim.keymap.set("n", "<leader>gf", function()
				builtin.git_files(dropdown_theme)
			end)

			telescope.load_extension("ui-select")
		end,
	},
}
