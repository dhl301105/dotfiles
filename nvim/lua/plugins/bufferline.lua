return {
	"akinsho/bufferline.nvim",
	enabled = false,
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function(_, opts)
		vim.opt.termguicolors = true
		require("bufferline").setup({
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
			},
		})
	end,
}
