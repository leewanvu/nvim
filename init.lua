-- Set <space> as the leader key
vim.g.maplocalleader = ' '
vim.g.mapleader = ' '

require('vux.lazy')
require('vux.options')
require('vux.keymaps')
require('vux.autocmds')
