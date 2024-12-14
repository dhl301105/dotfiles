return {
	"akinsho/bufferline.nvim",
	enabled = false,
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function(_, opts)
		vim.opt.termguicolors = true
		require("bufferline").setup({
			always_show_bufferline = false,
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
