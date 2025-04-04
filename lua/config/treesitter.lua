local parser_install_dir = NVIM_HOMEDIR .. "/treesitter"
vim.opt.runtimepath:prepend(parser_install_dir)
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

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
    -- ensure_installed = "all",
    ensure_installed = {
        -- programming languages
        "go",
        "python",
        "rust",
        "c",
        "javascript",
        "typescript",
        "elixir",
        "erlang",
        "dart",
        "zig",
        "perl",
        "php",
        "ruby",
        "lua",
        "hare",
        "kotlin",
        "c_sharp",
        "clojure",
        "java",
        "elm",
        "nim",
        "tsx",
        "html",
        "css",
        "v",
        "vala",
        -- text
        "vim",
        "markdown_inline",
        "typst",
        "latex",
        -- shell
        "powershell",
        "bash",
        -- automation
        "make",
        "cmake",
        "groovy",
        "ninja",
        -- config
        "ini",
        "json",
        "yaml",
        "toml",
        "jsonnet",
        "rasi",
        "ssh_config",
        "nginx",
        "nix",
        "sway",
        -- cloud
        "helm",
        "jinja",
        "proto",
        "terraform",
        -- varia
        "llvm",
        "jq",
    },
    parser_install_dir = parser_install_dir,
})
