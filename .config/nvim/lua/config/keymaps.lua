vim.g.mapleader = " "

-- esc jj
vim.keymap.set("i", "jj", "<Esc>")

-- oil.lua
vim.keymap.set("n", "of", ":Oil --float .<CR>")
vim.keymap.set("n", "<C-s>", "actions.select.vsplit")
vim.keymap.set("n", "<C-h>", "actions.select.split")
vim.keymap.set("n", "<C-p>", "actions.preview")
