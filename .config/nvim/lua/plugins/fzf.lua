return {
	{
		"ibhagwan/fzf-lua",
		enabled = true,
		-- optional for icon support
		keys = {
			{ "<space>fh", "<cmd>FzfLua files cwd=~<cr>", desc = "fzf find home dir" },
			{ "<space>fn", "<cmd>FzfLua files cwd=~/.config/nvim<cr>", desc = "fzf find nvim dir" },
			{ "<space>ff", "<cmd>FzfLua files<cr>", desc = "fzf find root dir" },
			{ "<space>fd", "<cmd>FzfLua diagnostics_document<cr>", desc = "fzf diagnostic_document" },
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({
				files = {
					fd_opts = [[--type f --hidden --exclude .git --exclude node_modules --exclude build --exclude .cache]],
				},
			})
		end,
	},
	{ "junegunn/fzf", build = "./install --bin" },
}
