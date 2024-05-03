-- Call netrw
vim.keymap.set("n", "<C-n>", vim.cmd.Explore)
require 'nvim-web-devicons'.setup {
    -- your personnal icons can go here (to override)
    override = {
        zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh"
        }
    },
    -- globally enable "strict" selection of icons - icon will be looked up in
    -- different tables, first by filename, and if not found by extension; this
    -- prevents cases when file doesn't have any extension but still gets some icon
    -- because its name happened to match some extension
    strict = true,
    -- same as `override` but specifically for overrides by filename
    -- takes effect when `strict` is true
    override_by_filename = {
        [".gitignore"] = {
            icon = "",
            color = "#f1502f",
            name = "Gitignore"
        }
    },
    -- same as `override` but specifically for overrides by extension
    -- takes effect when `strict` is true
    override_by_extension = {
        ["log"] = {
            icon = "",
            color = "#81e043",
            name = "Log"
        }
    },
}

require 'netrw'.setup {
    -- Put your configuration here, or leave the object empty to take the default
    -- configuration.
    icons = {
        symlink = '', -- Symlink icon (directory and file)
        directory = '', -- Directory icon
        file = '', -- File icon
    },
    use_devicons = true, -- Uses nvim-web-devicons if true, otherwise use the file icon specified above
    mappings = {}, -- Custom key mappings
}
