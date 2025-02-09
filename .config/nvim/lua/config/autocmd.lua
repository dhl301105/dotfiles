vim.api.nvim_create_augroup("All", { clear = true })

vim.api.nvim_create_autocmd("VimLeave", {
	group = "All",
	pattern = "*",
	command = "set guicursor=a:ver1",
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	group = "All",
	pattern = "*.ini",
	callback = function()
		vim.cmd([[ 
      set syntax=dosini
    ]])
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = "All",
	pattern = "*.rasi",
	callback = function()
		vim.bo.filetype = "rasi" -- Đặt kiểu file là "rasi"
	end,
})
