
local keymap = vim.keymap

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

keymap.set("n", "q", ":q<cr>")

keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")
