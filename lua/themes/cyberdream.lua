return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            borderless_telescope = false,
            theme = {
                variant = "auto",
            },
        })
        vim.api.nvim_set_keymap("n", "<leader>tt", ":CyberdreamToggleMode<CR>", { noremap = true, silent = true })
        vim.cmd([[ colorscheme cyberdream ]])
    end
}
