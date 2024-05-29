-- (Python) Activate venv before starting the LSP
require('venv-lsp').init()

-- GENERAL LSP CONFIGURATION --
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Mason configuration
-- Mason is a LSP-related package manager.
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'pyright',
        'ruff_lsp',
        'lua_ls'
    }
})

-- SPECIFIC LSP CONFIGURATION --
-- Lua:
require('lspconfig').lua_ls.setup({
    capabilities = lsp_capabilities,
    on_attach = function(client, bufnr)
        require 'completion'.on_attach(client)
        vim.lsp.inlay_hint.enable(bufnr)
    end,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT'
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                }
            }
        }
    }
})
-- Python:
-- Ruff for linting and formatting:
require('lspconfig').ruff_lsp.setup {
    capabilities = lsp_capabilities
}
-- Pyright for everything else:
require('lspconfig').pyright.setup {
    capabilities = lsp_capabilities,
    on_attach = function(client, bufnr)
        require 'completion'.on_attach(client)
        vim.lsp.inlay_hint.enable(bufnr)
    end,
    settings = {
        pyright = {
            autoImportCompletion = true,
            -- Using Ruff's import organizer
            disableOrganizeImports = true
        },
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = 'openFilesOnly',
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off",
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { '*' }
            }
        }
    }
}
-- Rust:
require('lspconfig').rust_analyzer.setup({
    capabilities = lsp_capabilities,
    on_attach = function(client, bufnr)
        require 'completion'.on_attach(client)
        vim.lsp.inlay_hint.enable(bufnr)
    end,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})

-- AUTOCOMPLETE CONFIGURATION --
require("luasnip.loaders.from_vscode").lazy_load() -- Load VSCode-like Snippets
local luasnip = require("luasnip")
local cmp = require('cmp')
local select_opts = { behavior = cmp.SelectBehavior.Select }

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'buffer',   keyword_length = 3 },
        { name = 'luasnip',  keyword_length = 2 },
    },
    window = {
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        fields = { 'menu', 'abbr', 'kind' }
    },
    mapping = {
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        ['<C-f>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
                cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item(select_opts)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },

})

-- LINTING CONFIGURATION --
-- Enable linters
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
