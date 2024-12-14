local keymap = vim.keymap

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

keymap.set("n", "q", ":q<cr>")

keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")

keymap.set("n", "H", ":bprevious<cr>")
keymap.set("n", "L", ":bNext<cr>")

keymap.set("n", "<c-h>", "<c-w><left>")
keymap.set("n", "<c-j>", "<c-w><down>")
keymap.set("n", "<c-k>", "<c-w><up>")
keymap.set("n", "<c-l>", "<c-w><right>")

keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")
