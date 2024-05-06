-- (Python) Activate venv before starting the LSP
require('venv-lsp').init()

-- GENERAL LSP CONFIGURATION --
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_setup = function(server)
    require('lspconfig')[server].setup({
        capabilities = lsp_capabilities,
    })
end

-- Mason configuration
-- Mason is a LSP-related package manager.
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'pyright',
        'ruff_lsp',
        'rust_analyzer',
        'lua_ls'
    },
    handlers = {
        default_setup,
    },
})

-- SPECIFIC LSP CONFIGURATION --
-- Lua:
require('lspconfig').lua_ls.setup({
    capabilities = lsp_capabilities,
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
  init_options = {
    settings = {
      args = {},
    }
  }
}
-- Pyright for everything else:
require('lspconfig').pyright.setup {
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

-- SNIPPET CONFIGURATION --
-- Load VSCode-like Snippets
require("luasnip.loaders.from_vscode").lazy_load()
local luasnip = require("luasnip")
local cmp = require('cmp')

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    -- Define snippet engine
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
        { name = 'path' },
    }, {
        { name = 'buffer' },
    }),
})

-- LINTING CONFIGURATION --
-- Enable linters
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
