local M = {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.10.0",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
}

return { M }
