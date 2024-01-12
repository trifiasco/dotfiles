-- settings
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local g = vim.g

-- general settings
--- use clipboard
o.clipboard = 'unnamedplus'

--- useful for searching
o.ignorecase = true
o.smartcase = true

--- tab related
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true

--- don't want any backup or swap files
o.backup = false
o.wb = false
o.swapfile = false

-- fold settings
-- needed for ufo plugin to work
o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = -1
o.foldenable = true


-- window local settings
--- show numbers (relatively)
wo.number = true
wo.relativenumber = true

--- highlight 88th column
wo.colorcolumn = '88'

--- always show signcolumn
wo.signcolumn = 'yes'

--- break line when too long
wo.linebreak = true

vim.g.copilot_assume_mapped = true
