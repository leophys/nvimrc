-- Basics

NVIM_HOMEDIR = os.getenv('HOME') .. '/.config/nvim'

-- Configs

require "config.options"
require "config.lazy"
require "config.lualine"
require "config.treesitter"
-- require "config.cmp"
require "config.lspconfig"
require "config.keymaps"
