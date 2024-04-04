require('lazy').setup({
    'jglasovic/venv-lsp.nvim',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'tpope/vim-surround',
    'tpope/vim-repeat',
    'tommcdo/vim-fubitive',
    'b3nj5m1n/kommentary',
    'nvie/vim-flake8',
    'stevearc/aerial.nvim',
    'akinsho/toggleterm.nvim',
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl' },
    -- LSP and related tools:
    {
        'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
            {
                'hrsh7th/nvim-cmp',
                dependencies = {
                    'hrsh7th/cmp-nvim-lsp',
                    'hrsh7th/cmp-nvim-lsp-signature-help',
                    'hrsh7th/cmp-path',
                    'saadparwaiz1/cmp_luasnip'
                }
            },
            {
                'L3MON4D3/LuaSnip',
                dependencies = {
                    'rafamadriz/friendly-snippets',
                }
            },
            "jay-babu/mason-nvim-dap.nvim",
            'mfussenegger/nvim-dap',
            'mfussenegger/nvim-dap-python',
            'rcarriga/nvim-dap-ui',
            'mfussenegger/nvim-lint',
            'mhartington/formatter.nvim',

        }
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "antoinemadec/FixCursorHold.nvim",
            'nvim-treesitter/nvim-treesitter'
        }
    },
    'nvim-neotest/neotest-python',
    -- The colorscheme I use:
    'navarasu/onedark.nvim',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },
    {
        'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
    },
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },
    {
        'alexghergh/nvim-tmux-navigation',
        config = function()
            local nvim_tmux_nav = require('nvim-tmux-navigation')
            nvim_tmux_nav.setup {
                disable_when_zoomed = true -- defaults to false
            }
            vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
            vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    }
})
