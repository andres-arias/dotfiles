vim.g.mapleader = ","

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Seach file" })
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope aerial<cr>", { desc = "Seach outline" })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Search Git files" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Search open buffers" })

vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "git status" })
vim.keymap.set("n", "<leader>gf", "<cmd>Gvdiffsplit<cr>", { desc = "git diff" })
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "git blame" })

vim.keymap.set("n", "<leader>n", ":bn<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>p", ":bp<cr>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>d", ":bd<cr>", { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle!<CR>", { desc = "Toggle Outline" })
vim.keymap.set("n", "<leader>h", "<cmd>WhichKey<cr>", { desc = "Show all keybindings" })
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Toggle Undo Tree" })
vim.keymap.set("n", "<leader>;", "A;<Esc>", { desc = "Add simicolon at the end of line" })
