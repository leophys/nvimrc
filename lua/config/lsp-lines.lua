vim.diagnostic.config({ virtual_lines = true })
vim.keymap.set(
    "",
    "<space>L",
    require("lsp_lines").toggle,
    { desc = "Toggle lsp_lines" }
)
