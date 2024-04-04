local wk = require("which-key")
local Terminal  = require('toggleterm.terminal').Terminal

vim.g.mapleader = ","
-- Easier sidepane navigation
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

vim.g.fubitive_domain_pattern = 'bscrd\\.codefactori\\.com'
vim.g.fubitive_domain_context_path = 'bitbucket'

-- Function to launch lazygit inside a internal terminal
local lazygit = Terminal:new({cmd = "lazygit", hidden = true, direction = 'float'})
function Lazygit_toggle()
  lazygit:toggle()
end

wk.register({
    -- Telescope mappings
    f = {
        name = "Telescope",
        f = { "<cmd>Telescope find_files<cr>", "Seach file" },
        a = { "<cmd>Telescope aerial<cr>", "Seach outline" },
        s = { "<cmd>Telescope live_grep<cr>", "Live grep" },
        g = { "<cmd>Telescope git_files<cr>", "Search Git files" }
    },
    -- Git mappings
    g = {
        name = "Git",
        s = { vim.cmd.Git, "git status" },
        f = { "<cmd>Gvdiffsplit<cr>", "git diff" },
        b = { "<cmd>Git blame<cr>", "git blame" },
        m = { "<cmd>Git mergetool<cr>", "git mergetool" },
    },
    -- Terminal mappings
    t = {
        name = "Toggle Terminal",
        h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Horizontal" },
        v = { "<cmd>ToggleTerm direction=vertical size=40<cr>", "Vertical" },
        t = { "<cmd>ToggleTerm direction=tab<cr>", "Tab" },
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        g = { "<cmd>lua Lazygit_toggle()<cr>", "LazyGit" }
    },
    a = { "<cmd>AerialToggle!<CR>", "Toggle Outline" },
    o = { "o<Esc>", "Add empty line" },
    h = { "<cmd>WhichKey<cr>", "Show all keybindings" },
    u = { "<cmd>UndotreeToggle<cr>", "Toggle Undo Tree" },
    [";"] = { "A;<Esc>", "Add simicolon at the end of line" },
    -- Global LSP mappings
}, { prefix = "<leader>" })

-- LSP-related mappings
wk.register({
    ['[d'] = { '<cmd>lua vim.diagnostic.goto_prev()<cr>', "Go to previous diagnostic" },
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
