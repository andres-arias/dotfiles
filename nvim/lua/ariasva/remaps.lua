vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

-- Quickly insert an empty new line without entering insert mode
vim.keymap.set("n", "<Leader>o", "o<Esc>")
-- Adds a semicolon to the end of the line.
vim.keymap.set("n", "<Leader>;", "A;<Esc>")
-- Easier sidepane navigation
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
