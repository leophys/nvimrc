return {
    "TabbyML/vim-tabby",
    lazy = false,
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    init = function()
        -- vim.g.tabby_agent_start_command = { NVIM_HOMEDIR .. "/deps/tabby/node_modules/.bin/tabby-agent", "--stdio" }
        vim.g.tabby_agent_start_command = { NVIM_HOMEDIR .. "/deps/tabby/start.sh" }
        vim.g.tabby_inline_completion_trigger = "auto"
        vim.g.tabby_inline_completion_keybinding_accept = "<C-A>"
    end,
}
