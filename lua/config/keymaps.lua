local _map = require('nvim-mapper').map

local function apply_map(args)
    if args['modes'] ~= nil then
        for mode in ipairs(args.modes) do
            args.mode = mode
            apply_map(args)
        end
    end

    _map(args.mode, args.keys, args.cmd, args.options, args.category, args.unique_identifier, args.description)
end

local opts = { noremap = true, silent = true }

local keymaps = {
    -- Movement: text
    { mode = 'n', keys = '<C-Down>',      cmd = '<cmd>m .+1<CR>==',                                  options = opts,               category = 'Movement',        unique_identifier = 'line_move_down_n',           description = 'Move line down (normal mode)' },
    { mode = 'n', keys = '<C-Up>',        cmd = '<cmd>m .-2<CR>==',                                  options = opts,               category = 'Movement',        unique_identifier = 'line_move_up_n',             description = 'Move line up (normal mode)' },
    { mode = 'i', keys = '<C-Down>',      cmd = '<Esc>:m .+1<CR>==gi',                               options = opts,               category = 'Movement',        unique_identifier = 'line_move_down_i',           description = 'Move line down (inser mode)' },
    { mode = 'i', keys = '<C-Up>',        cmd = '<Esc>:m .-2<CR>==gi',                               options = opts,               category = 'Movement',        unique_identifier = 'line_move_up_i',             description = 'Move line up (insert mode)' },
    { mode = 'v', keys = '<C-Down>',      cmd = ":m '>+1<CR>gv=gv",                                  options = opts,               category = 'Movement',        unique_identifier = 'line_move_down_v',           description = 'Move line down (visual mode)' },
    { mode = 'v', keys = '<C-Up>',        cmd = ":m '<-2<CR>gv=gv",                                  options = opts,               category = 'Movement',        unique_identifier = 'line_move_up_v',             description = 'Move line up (visual mode)' },
    -- Movement: splits
    { mode = 'n', keys = '<C-l>',         cmd = '<C-w>l',                                            options = opts,               category = "Movement",        unique_identifier = "pane_move_right_n",          description = "Move to the split to the right" },
    { mode = 'v', keys = '<C-l>',         cmd = '<C-w>l',                                            options = opts,               category = "Movement",        unique_identifier = "pane_move_right_v",          description = "Move to the split to the right" },
    { mode = 'i', keys = '<C-l>',         cmd = '<C-w>l',                                            options = opts,               category = "Movement",        unique_identifier = "pane_move_right_i",          description = "Move to the split to the right" },

    { mode = 'n', keys = '<C-k>',         cmd = '<C-w>k',                                            options = opts,               category = "Movement",        unique_identifier = "pane_move_up_n",             description = "Move to the upper split" },
    { mode = 'v', keys = '<C-k>',         cmd = '<C-w>k',                                            options = opts,               category = "Movement",        unique_identifier = "pane_move_up_v",             description = "Move to the upper split" },
    { mode = 'i', keys = '<C-k>',         cmd = '<C-w>k',                                            options = opts,               category = "Movement",        unique_identifier = "pane_move_up_i",             description = "Move to the upper split" },

    { mode = 'n', keys = '<C-j>',         cmd = '<C-w>j',                                            options = opts,               category = "Movement",        unique_identifier = "pane_move_down_n",           description = "Move to the lower split" },
    { mode = 'v', keys = '<C-j>',         cmd = '<C-w>j',                                            options = opts,               category = "Movement",        unique_identifier = "pane_move_down_v",           description = "Move to the lower split" },
    { mode = 'i', keys = '<C-j>',         cmd = '<C-w>j',                                            options = opts,               category = "Movement",        unique_identifier = "pane_move_down_i",           description = "Move to the lower split" },

    { mode = 'n', keys = '<C-h>',         cmd = '<C-w>h',                                            options = opts,               category = "Movement",        unique_identifier = "pane_move_left_n",           description = "Move to the split to the left" },
    { mode = 'v', keys = '<C-h>',         cmd = '<C-w>h',                                            options = opts,               category = "Movement",        unique_identifier = "pane_move_left_v",           description = "Move to the split to the left" },
    { mode = 'i', keys = '<C-h>',         cmd = '<C-w>h',                                            options = opts,               category = "Movement",        unique_identifier = "pane_move_left_i",           description = "Move to the split to the left" },

    { mode = 'n', keys = '<C-d>',         cmd = '<cmd>bd<cr>',                                       options = opts,               category = "Management",      unique_identifier = "full_close_n",               description = "Close current split and associated buffer" },
    { mode = 'v', keys = '<C-d>',         cmd = '<ESC><cmd>bd<cr>',                                  options = opts,               category = "Management",      unique_identifier = "full_close_v",               description = "Close current split and associated buffer" },
    { mode = 'i', keys = '<C-d>',         cmd = '<ESC><cmd>bd<cr>',                                  options = opts,               category = "Management",      unique_identifier = "full_close_i",               description = "Close current split and associated buffer" },

    { mode = 'n', keys = '<Leader><Tab>', cmd = '<cmd>bnext<cr>',                                    options = {},                 category = "Movement",        unique_identifier = "go_to_next_buf",             description = "Switch to the next buffer" },
    { mode = 'n', keys = '<Leader>\\',    cmd = '<cmd>bprev<cr>',                                    options = {},                 category = "Movement",        unique_identifier = "go_to_prev_buf",             description = "Switch to the previous buffer" },
    -- Telescope
    { mode = 'n', keys = '<Leader>ff',    cmd = '<cmd>Telescope find_files<cr>',                     options = opts,               category = "Telescope",       unique_identifier = "find_files",                 description = "Find files from current position" },
    { mode = 'n', keys = '<Leader>fg',    cmd = '<cmd>Telescope git_files<cr>',                      options = opts,               category = "Telescope",       unique_identifier = "git_files",                  description = "Find git-tracked files" },
    { mode = 'n', keys = '<Leader>fb',    cmd = '<cmd>Telescope buffers<cr>',                        options = opts,               category = "Telescope",       unique_identifier = "buffers",                    description = "Search in current opened buffers" },
    { mode = 'n', keys = '<Leader>fc',    cmd = '<cmd>Telescope grep_string<cr>',                    options = opts,               category = "Telescope",       unique_identifier = "grep_string",                description = "Search string from current position" },
    { mode = 'n', keys = '<Leader>fr',    cmd = '<cmd>Telescope live_grep<cr>',                      options = opts,               category = "Telescope",       unique_identifier = "live_grep",                  description = "Search string in real time" },
    { mode = 'n', keys = '<Leader>fR',    cmd = '<cmd>Telescope live_grep grep_open_files=true<cr>', options = opts,               category = "Telescope",       unique_identifier = "live_grep_open_buffers",     description = "Search string in real time (only on the open buffers)" },
    { mode = 'n', keys = '<Leader>ft',    cmd = '<cmd>Telescope treesitter<cr>',                     options = opts,               category = "Telescope",       unique_identifier = "treesitter",                 description = "Explore treesitter" },
    { mode = 'n', keys = '<Leader>fC',    cmd = '<cmd>Telescope git_bcommits<cr>',                   options = opts,               category = "Telescope",       unique_identifier = "git_bcommits",               description = "Show diff of current buffer" },
    { mode = 'n', keys = '<Leader>fh',    cmd = '<cmd>Telescope builtin<cr>',                        options = opts,               category = "Telescope",       unique_identifier = "builtin",                    description = "Show Telescope builtins" },
    { mode = 'n', keys = '<Leader>lr',    cmd = '<cmd>Telescope lsp_references<cr>',                 options = opts,               category = "Telescope",       unique_identifier = "lsp_references",             description = "Show references using LSP" },
    { mode = 'n', keys = '<Leader>li',    cmd = '<cmd>Telescope lsp_implementations<cr>',            options = opts,               category = "Telescope",       unique_identifier = "lsp_implementations",        description = "Show implementations using LSP" },
    { mode = 'n', keys = '<Leader>ld',    cmd = '<cmd>Telescope lsp_definitions<cr>',                options = opts,               category = "Telescope",       unique_identifier = "lsp_definitions",            description = "Show definitions using LSP" },
    { mode = 'n', keys = '<Leader>ls',    cmd = '<cmd>Telescope lsp_document_symbols<cr>',           options = opts,               category = "Telescope",       unique_identifier = "lsp_document_symbols",       description = "Show symbols in document using LSP" },
    -- Undo tree
    { mode = 'n', keys = '<Leader>u',     cmd = '<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>',     options = { noremap = true }, category = "UndoTree",        unique_identifier = "undo_tree_toggle",           description = "Toggle UndoTree browser" },
    -- Split maximizer
    { mode = 'n', keys = '<Leader>mm',    cmd = '<cmd>Maximize<cr>',                                 options = opts,               category = "MaximizerToggle", unique_identifier = "maximizer_toggle_n",         description = "Toggle maximal view of current split" },
    { mode = 'v', keys = '<Leader>mm',    cmd = '<cmd>Maximize<cr>',                                 options = opts,               category = "MaximizerToggle", unique_identifier = "maximizer_toggle_v",         description = "Toggle maximal view of current split" },
    -- Search niceties
    { mode = 'v', keys = '<Leader>/',     cmd = '<esc>:\\%V',                                        options = {},                 category = "Search",          unique_identifier = "search_in_visual_selection", description = "Search only in the current visual selection" },
    { mode = 'n', keys = '<Leader><esc>', cmd = ':silent! nohls<CR>:call clearmatches()<CR>',        options = opts,               category = "Search",          unique_identifier = "clean_selection",            description = "Clean the selection and remove highlight of the last matches" },
}

for _i, keymap in ipairs(keymaps) do
    apply_map(keymap)
end

-- structural search and replace
vim.keymap.set({ "n", "x" }, "<leader>sr", function() require("ssr").open() end)
