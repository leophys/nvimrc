local map = require('nvim-mapper').map

-- Move selection around
vim.cmd([[
    nnoremap <silent> <C-Down> :m .+1<CR>==
    nnoremap <silent> <C-Up> :m .-2<CR>==
    inoremap <silent> <C-Down> <Esc>:m .+1<CR>==gi
    inoremap <silent> <C-Up> <Esc>:m .-2<CR>==gi
    vnoremap <silent> <C-Down> :m '>+1<CR>gv=gv
    vnoremap <silent> <C-Up> :m '<-2<CR>gv=gv
]])

-- - Telescope-related
local opts = { noremap = true, silent = true }
map('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', opts, "Telescope", "find_files",
    "Find files from current position")
map('n', '<Leader>fg', '<cmd>Telescope git_files<cr>', opts, "Telescope", "git_files", "Find git-tracked files")
map('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', opts, "Telescope", "buffers", "Search in current opened buffers")
map('n', '<Leader>fc', '<cmd>Telescope grep_string<cr>', opts, "Telescope", "grep_string",
    "Search string from current position")
map('n', '<Leader>fr', '<cmd>Telescope live_grep<cr>', opts, "Telescope", "live_grep", "Search string in real time")
map('n', '<Leader>fR', '<cmd>Telescope live_grep grep_open_files=true<cr>', opts, "Telescope", "live_grep_open_buffers",
    "Search string in real time (only on the open buffers)")
map('n', '<Leader>ft', '<cmd>Telescope treesitter<cr>', opts, "Telescope", "treesitter", "Explore treesitter")
map('n', '<Leader>fC', '<cmd>Telescope git_bcommits<cr>', opts, "Telescope", "git_bcommits",
    "Show diff of current buffer")
map('n', '<Leader>fh', '<cmd>Telescope builtin<cr>', opts, "Telescope", "builtin", "Show Telescope builtins")
map('n', '<Leader>lr', '<cmd>Telescope lsp_references<cr>', opts, "Telescope", "lsp_references",
    "Show references using LSP")
map('n', '<Leader>li', '<cmd>Telescope lsp_implementations<cr>', opts, "Telescope", "lsp_implementations",
    "Show implementations using LSP")
map('n', '<Leader>ld', '<cmd>Telescope lsp_definitions<cr>', opts, "Telescope", "lsp_definitions",
    "Show definitions using LSP")
map('n', '<Leader>ls', '<cmd>Telescope lsp_document_symbols<cr>', opts, "Telescope", "lsp_document_symbols",
    "Show symbols in document using LSP")

-- Undo tree
map('n', '<Leader>u', '<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>', { noremap = true }, "UndoTree", "undo_tree_toggle"
, "Toggle UndoTree browser")

-- Split maximizer
map('n', '<Leader>mm', '<cmd>MaximizerToggle<cr>', opts, "MaximizerToggle", "maximizer_toggle_n",
    "Toggle maximal view of current split")
map('v', '<Leader>mm', '<cmd>MaximizerToggle<cr>', opts, "MaximizerToggle", "maximizer_toggle_v",
    "Toggle maximal view of current split")

-- Split movement and management
map('n', '<C-l>', '<C-w>l', opts, "Movement", "move_right_n", "Move to the split to the right")
map('v', '<C-l>', '<C-w>l', opts, "Movement", "move_right_v", "Move to the split to the right")
map('i', '<C-l>', '<C-w>l', opts, "Movement", "move_right_i", "Move to the split to the right")

map('n', '<C-k>', '<C-w>k', opts, "Movement", "move_up_n", "Move to the upper split")
map('v', '<C-k>', '<C-w>k', opts, "Movement", "move_up_v", "Move to the upper split")
map('i', '<C-k>', '<C-w>k', opts, "Movement", "move_up_i", "Move to the upper split")

map('n', '<C-j>', '<C-w>j', opts, "Movement", "move_down_n", "Move to the lower split")
map('v', '<C-j>', '<C-w>j', opts, "Movement", "move_down_v", "Move to the lower split")
map('i', '<C-j>', '<C-w>j', opts, "Movement", "move_down_i", "Move to the lower split")

map('n', '<C-h>', '<C-w>h', opts, "Movement", "move_left_n", "Move to the split to the left")
map('v', '<C-h>', '<C-w>h', opts, "Movement", "move_left_v", "Move to the split to the left")
map('i', '<C-h>', '<C-w>h', opts, "Movement", "move_left_i", "Move to the split to the left")

map('n', '<C-d>', '<cmd>bd<cr>', opts, "Management", "full_close_n", "Close current split and associated buffer")
map('v', '<C-d>', '<cmd>bd<cr>', opts, "Management", "full_close_v", "Close current split and associated buffer")
map('i', '<C-d>', '<cmd>bd<cr>', opts, "Management", "full_close_i", "Close current split and associated buffer")

map('n', '<Leader><Tab>', '<cmd>bnext<cr>', {}, "Movement", "go_to_next_buf", "Switch to the next buffer")
map('n', '<Leader>\\', '<cmd>bprev<cr>', {}, "Movement", "go_to_prev_buf", "Switch to the previous buffer")

-- Search niceties

map('v', '<Leader>/', '<esc>:\\%V', {}, "Search", "search_in_visual_selection",
    "Search only in the current visual selection")
-- structural search and replace
vim.keymap.set({ "n", "x" }, "<leader>sr", function() require("ssr").open() end)
