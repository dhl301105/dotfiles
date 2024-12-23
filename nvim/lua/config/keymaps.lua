local keymap = vim.keymap

keymap.set("n", "<space>d", ":lua vim.diagnostic.open_float()<cr>")

keymap.set("i", "jj", "<esc>")

-- refactor rename
keymap.set({ "n", "v" }, "<space>rr", ":lua vim.lsp.buf.rename()<cr>")

-- Select all
keymap.set("n", "<space>a", "gg<S-v>G")

keymap.set("n", "q", ":q<cr>")

keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")

keymap.set("n", "H", ":bprevious<cr>")
keymap.set("n", "L", ":bNext<cr>")

keymap.set("n", "<space>h", "<c-w><left>")
keymap.set("n", "<space>j", "<c-w><down>")
keymap.set("n", "<space>k", "<c-w><up>")
keymap.set("n", "<space>l", "<c-w><right>")

keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")
