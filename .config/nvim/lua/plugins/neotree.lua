return {
	"nvim-neo-tree/neo-tree.nvim",
	keys = {
		{ "<space>ee", "<cmd>Neotree<cr>", desc = "Open Neotree root dir" },
		{ "<space>eh", "<cmd>Neotree ~<cr>", desc = "Open Neotree home dir" },
		{ "<space>en", "<cmd>Neotree ~/.config/nvim<cr>", desc = "Open Neotree nvim dir" },
	},
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function(_, opts)
		require("neo-tree").setup({
			-- filesystem = {
			-- 	hide_dotfiles = false,
			-- 	hide_hidden = true,
			-- },
			window = {
				width = 20,
			},
		})
	end,
}
