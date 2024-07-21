local parser_install_dir = NVIM_HOMEDIR .. "/treesitter"
vim.opt.runtimepath:prepend(parser_install_dir)

require('nvim-treesitter.configs').setup({
    autotag = {
        enable = true,
    },
    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = {
        enable = true
    },
    ensure_installed = "all",
    parser_install_dir = parser_install_dir,
})
