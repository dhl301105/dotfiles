return {
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		config = function(_, opts)
			local ls = require("luasnip")

			vim.keymap.set({ "i" }, "<C-K>", function()
				ls.expand()
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-L>", function()
				ls.jump(1)
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-H>", function()
				ls.jump(-1)
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-E>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true })
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	"saadparwaiz1/cmp_luasnip",
	{
		"williamboman/mason.nvim",
		config = function(_, opts)
			require("mason").setup({
				ui = {
					border = "single",
					size = {
						width = 0.8,
						height = 0.8,
					},
				},
			})
		end,
	},

	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				html = { "htmlhint" },
				javascript = { "eslint_d" },
				cpp = { "cpplint" },
				c = { "cpplint" },
			}
		end,
	},
	{
		"rshkarin/mason-nvim-lint",
		config = function()
			require("mason-nvim-lint").setup()
		end,
	},

	{
		"stevearc/conform.nvim",
		opts = {},
		config = function(_, opts)
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					c = { "astyle" },
					cpp = { "astyle" },
					bash = { "shfmt" },
					zsh = { "shfmt" },
					sh = { "shfmt" },
					-- Conform will run multiple formatters sequentially
					-- python = { "isort", "black" },
					-- You can customize some of the format options for the filetype (:help conform.format)
					-- rust = { "rustfmt", lsp_format = "fallback" },
					-- Conform will run the first available formatter
					javascript = { "prettierd", stop_after_first = true },
					html = { "prettierd", stop_after_first = true },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					-- try_lint without arguments runs the linters defined in `linters_by_ft`
					-- for the current filetype
					require("lint").try_lint()

					-- You can call `try_lint` with a linter name or a list of names to always
					-- run specific linters, independent of the `linters_by_ft` configuration
					-- require("lint").try_lint("cspell")
				end,
			})
		end,
	},
	{
		"zapling/mason-conform.nvim",
		config = function()
			require("mason-conform").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function(_, opts)
			require("mason-lspconfig").setup({
				---ensure_installed = { "lua_ls", "clangd", "emmet_language_server", "eslint", "jdtls", "ts_ls" },
				---@type boolean
				automatic_installation = true,
			})
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		config = function(_, opts)
			-- Set up nvim-cmp.
			local cmp = require("cmp")

			local ELLIPSIS_CHAR = "…"
			local MAX_LABEL_WIDTH = 30
			local MAX_KIND_WIDTH = 10

			local get_ws = function(max, len)
				return (" "):rep(max - len)
			end

			local format = function(_, item)
				local content = item.abbr
				-- local kind_symbol = symbols[item.kind]
				-- item.kind = kind_symbol .. get_ws(MAX_KIND_WIDTH, #kind_symbol)

				if #content > MAX_LABEL_WIDTH then
					item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
				else
					item.abbr = content .. get_ws(MAX_LABEL_WIDTH, #content)
				end

				return item
			end

			cmp.setup({
				formatting = {
					-- format = format,
				},
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
						-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<s-tab>"] = cmp.mapping.select_prev_item(),
					["<tab>"] = cmp.mapping.select_next_item(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					-- { name = "vsnip" }, -- For vsnip users.
					{ name = "luasnip" }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
				}, {
					{ name = "buffer" },
				}),
			})

			-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
			-- Set configuration for specific filetype.
			--[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]
			--

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})

			-- Set up lspconfig.
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
			require("lspconfig")["lua_ls"].setup({
				capabilities = capabilities,
			})
			require("lspconfig")["clangd"].setup({
				capabilities = capabilities,
			})
			-- require("lspconfig")["lua_ls"].setup({
			-- 	capabilities = capabilities,
			-- })
			require("lspconfig")["emmet_language_server"].setup({
				capabilities = capabilities,
			})
			require("lspconfig")["ts_ls"].setup({
				capabilities = capabilities,
			})
			require("lspconfig")["eslint"].setup({
				capabilities = capabilities,
			})
			---require("lspconfig")["jdtls"].setup({
			---	capabilities = capabilities,
			---})
			require("lspconfig")["pylsp"].setup({
				capabilities = capabilities,
				settings = {
					pylsp = {
						plugins = {
							-- jedi = {
							-- 	environment = python,
							-- },
							-- pycodestyle = {
							-- 	ignore = { "E225", "E226", "E231", "E501", "E251" },
							-- 	maxLineLength = 100,
							-- },
						},
					},
				},
			})
		end,
	},
}
