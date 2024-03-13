local wk = require("which-key")
local telescope = require('telescope.builtin')

vim.g.mapleader = ","
-- Easier sidepane navigation
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

vim.g.fubitive_domain_pattern = 'bscrd\\.codefactori\\.com'
vim.g.fubitive_domain_context_path = 'bitbucket'

wk.register({
    -- Telescope mappings
    f = {
        name = "Telescope",
        f = {"<cmd>Telescope find_files<cr>", "Seach file"},
        a = {"<cmd>Telescope aerial<cr>", "Seach outline"},
        s = {"<cmd>Telescope live_grep<cr>", "Live grep"},
        g = {"<cmd>Telescope git_files<cr>", "Search Git files"}
    },
    -- Git mappings
    g = {
        name = "Git",
        s = {vim.cmd.Git, "git status"},
        d = {"<cmd>Gvdiffsplit<cr>", "git diff"},
        b = {"<cmd>Git blame<cr>", "git blame"},
        m = {"<cmd>Git mergetool<cr>", "git mergetool"},
    },
    a = {"<cmd>AerialToggle!<CR>", "Toggle Outline"},
    e = {vim.diagnostic.open_float, "Extend error message"},
    o = {"o<Esc>", "Add empty line"},
    u = {"<cmd>UndotreeToggle<cr>", "Toggle Undo Tree"},
}, {prefix = "<leader>"})

wk.register({
    ["<leader>;"] = {"A;<Esc>", "Add simicolon at the end of line"}
})
