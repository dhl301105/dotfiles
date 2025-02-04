return {
	{
		"folke/tokyonight.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function(_, opts)
			require("tokyonight").setup({
				transparent = true,
			})
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		"maxmx03/solarized.nvim",
		lazy = false,
		priority = 1000,
		---@type solarized.config
		opts = {
			transparent = {
				enabled = true,
			},
		},
		config = function(_, opts)
			vim.o.termguicolors = true
			vim.o.background = "light"
			require("solarized").setup(opts)
			vim.cmd.colorscheme("solarized")
		end,
	},
	-- {
	-- 	"craftzdog/solarized-osaka.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function(_, opts)
	-- 		vim.cmd.colorscheme("solarized-osaka")
	-- 	end,
	-- },
}
