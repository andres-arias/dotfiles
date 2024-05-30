require('lazy').setup({
    'folke/tokyonight.nvim',
    'jglasovic/venv-lsp.nvim',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'tpope/vim-surround',
    'tpope/vim-repeat',
    'tommcdo/vim-fubitive',
    'b3nj5m1n/kommentary',
    'nvie/vim-flake8',
    'stevearc/aerial.nvim',
    'alexghergh/nvim-tmux-navigation',
    'prichrd/netrw.nvim',
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl' },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    {
      'stevearc/oil.nvim',
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    },
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
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        }
    },
    'nvim-neotest/neotest-python',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },
    {
        "cuducos/yaml.nvim",
        ft = { "yaml" }, -- optional
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    }
})
