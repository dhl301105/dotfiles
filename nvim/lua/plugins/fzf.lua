return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		keys = {
			{ "<space>fh", "<cmd>FzfLua files cwd=~<cr>", desc = "fzf find home dir" },
			{ "<space>fn", "<cmd>FzfLua files cwd=~/.config/nvim<cr>", desc = "fzf find nvim dir" },
			{ "<space>ff", "<cmd>FzfLua files<cr>", desc = "fzf find root dir" },
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
		end,
	},
	{ "junegunn/fzf", build = "./install --bin" },
}
