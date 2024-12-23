return {
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
			vim.o.background = "dark"
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
