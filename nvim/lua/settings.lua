--[[
   this file will contain general settings
   
   vim has several kinds of options to be set, lua methods to set these different options are:
   1. general options - vim.api.nvim_set_option() or vim.o
   2. buffer-local options - vim.api.nvim_buff_set_option() or vim.bo
   3. window-local options - vim.api.nvim_win_set_option() or vim.wo
   4. global options - vim.g
]]

local o = vim.o
local bo = vim.bo
local wo = vim.wo
local g = vim.g


-- general options - lexicographically sorted
o.background = 'dark'
o.clipboard = 'unnamedplus'
o.cmdheight = 2
o.ignorecase = true
o.shiftwidth = 4
o.smartcase = true
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true
o.updatetime = 250
o.termguicolors = true

o.backup = false
o.wb = false

-- buffer local options - lexicographically sorted
bo.wrapmargin = 8
bo.swapfile = false

-- window local options - lexicographically sorted
wo.colorcolumn = '80'
wo.linebreak = true
wo.number = true
wo.relativenumber = true
wo.signcolumn = 'yes'
wo.wrap = true

-- global settings
vim.diagnostic.config({virtual_text = false})
