local wk = require("which-key")
local nvim_tmux_nav = require('nvim-tmux-navigation')

vim.g.mapleader = ","
-- Enable navigation between tmux panes
vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

wk.register({
    -- Telescope mappings
    f = {
        name = "Telescope",
        f = { "<cmd>Telescope find_files<cr>", "Seach file" },
        a = { "<cmd>Telescope aerial<cr>", "Seach outline" },
        s = { "<cmd>Telescope live_grep<cr>", "Live grep" },
        g = { "<cmd>Telescope git_files<cr>", "Search Git files" },
        b = { "<cmd>Telescope buffers<cr>", "Search open buffers" }
    },
    -- Git mappings
    g = {
        name = "Git",
        s = { vim.cmd.Git, "git status" },
        f = { "<cmd>Gvdiffsplit<cr>", "git diff" },
        b = { "<cmd>Git blame<cr>", "git blame" },
        m = { "<cmd>Git mergetool<cr>", "git mergetool" },
    },
    -- Testing mappings
    t = {
        name = "Neotest",
        p = { "<cmd>Neotest summary toggle<cr>", "Open Test Menu" },
        r = { "<cmd>Neotest run<cr>", "Run current test" },
        a = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run all tests" },
        o = { "<cmd>Neotest output open<cr>", "Open test output for current test" }
    },
    -- Buffer navigation mappings:
    n = { ":bn<cr>", "Next Buffer" },
    p = { ":bp<cr>", "Previous Buffer" },
    d = { ":bd<cr>", "Close Buffer" },
    --
    o = { "<cmd>AerialToggle!<CR>", "Toggle Outline" },
    h = { "<cmd>WhichKey<cr>", "Show all keybindings" },
    u = { "<cmd>UndotreeToggle<cr>", "Toggle Undo Tree" },
    [";"] = { "A;<Esc>", "Add simicolon at the end of line" },
    -- Global LSP mappings
}, { prefix = "<leader>" })

-- LSP-related mappings
wk.register({
    ['[d'] = { '<cmd>lua vim.diagnostic.got.exeo_prev()<cr>', "Go to previous diagnostic" },
    [']d'] = { '<cmd>lua vim.diagnostic.goto_next()<cr>', "Go to next diagnostic" },
    gl = { vim.diagnostic.open_float, "Extend error message" }
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }
        -- these will be buffer-local keybindings
        -- because they only work if you have an active language server
        wk.register({
            K = {
                '<cmd>lua vim.lsp.buf.hover()<cr>',
                "View Symbol Information"
            },
            gd = {
                '<cmd>lua vim.lsp.buf.definition()<cr>',
                "Go to definition"
            },
            gD = {
                '<cmd>lua vim.lsp.buf.declaration()<cr>',
                "Go to declaration"
            },
            gi = {
                '<cmd>lua vim.lsp.buf.implementation()<cr>',
                "List all implementations"
            },
            go = {
                '<cmd>lua vim.lsp.buf.type_definition()<cr>',
                "Go to definition of the type"
            },
            gr = {
                '<cmd>lua vim.lsp.buf.references()<cr>',
                "List all references to the symbol"
            },
            gs = {
                '<cmd>lua vim.lsp.buf.signature_help()<cr>',
                "Display signature information"
            },
            ['<F2>'] = {
                '<cmd>lua vim.lsp.buf.rename()<cr>',
                "Rename symbol"
            },
            ['<F4>'] = {
                '<cmd>lua vim.lsp.buf.code_action()<cr>',
                "Perform code action"
            },
            ['<F3>'] = {
                '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
                "Run formatter", mode = { 'n', 'x'}
            }
        }, opts)
    end
})
