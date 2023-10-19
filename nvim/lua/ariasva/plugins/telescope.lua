local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>s', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
