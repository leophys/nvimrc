local options = {
    -- global
    compatible = false,
    termguicolors = true,
    number = true,
    showtabline = 2,
    cursorline = true,
    ttyfast = true,
    listchars = 'tab:› ,nbsp:␣,trail:•,extends:⟩,precedes:⟨',
    list = true,
    autoindent = false,
    smartindent = false,
    -- search-related
    showmatch = true,
    incsearch = true,
    hlsearch = true,
    smartcase = true,
    -- splits and windows
    splitbelow = true,
    splitright = true,
    -- status-related
    backup = true,
    backupdir = NVIM_HOMEDIR .. '/backup',
    swapfile = true,
    directory = NVIM_HOMEDIR .. '/swap',
    undofile = true,
    undodir = NVIM_HOMEDIR .. '/undo',
    undolevels = 1000,
    undoreload = 100000,
    autoread = true,
    foldlevel = 10,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"
