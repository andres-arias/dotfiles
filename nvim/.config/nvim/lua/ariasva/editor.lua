vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
-- Set undodir based on platform
vim.opt.undodir = vim.fn.stdpath('data') .. (vim.fn.has("win32") == 1 and "\\undodir" or "/.vim/undodir")

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.clipboard="unnamedplus"

vim.api.nvim_exec([[
augroup JenkinsfileSyntax
autocmd!
autocmd BufReadPost Jenkinsfile set syntax=groovy
augroup END
]], false)
require("yaml_nvim").setup({ ft = { "yaml",  "yml" } })
