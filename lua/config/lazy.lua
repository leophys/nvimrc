-- Bootstrap lazy.nvim
local lazypath = NVIM_HOMEDIR .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    root = NVIM_HOMEDIR .. '/lazy/plugins',
    rocks = {
        root = NVIM_HOMEDIR .. '/lazy/rocks',
        server = "https://nvim-neorocks.github.io/rocks-binaries/",
    },
    spec = {
        { import = "plugins" },
    },
    checker = { enabled = true },
})
