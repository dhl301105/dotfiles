return {
	{
		"catppuccin/nvim",
		enabled = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"folke/tokyonight.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		config = function(_, opts)
			require("tokyonight").setup({
				style = "storm",
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		"maxmx03/solarized.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		---@type solarized.config
		opts = {
			transparent = {
				enabled = true,
			},
		},
		config = function(_, opts)
			require("solarized").setup(opts)
			vim.cmd.colorscheme("solarized")
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("solarized-osaka").setup({
				styles = {
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "transparent", -- style for sidebars, see below
					floats = "transparent", -- style for floating windows
				},
			})
			vim.cmd.colorscheme("solarized-osaka")
		end,
	},
}
