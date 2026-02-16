--[[
   this file will contain keybindings that are NOT plugin-specific.
   Plugin keymaps are defined in their respective plugin specs.
]]

local maps = require('trifiasco.utils.maps')
local imap = maps.imap
local nmap = maps.nmap

local opts_noremap_silent = { noremap = true, silent = true }

-- Things I can't live without
imap{'kj', '<ESC>'}
nmap {'<leader>w', ':w!<CR>'}
nmap  {';', ':'}
nmap{'<leader>q', ':bd!<CR>'}

-- reload stuff that almost never works
nmap{'<leader><leader>x', ': source %<CR>'}

-- opens/close quickfix list
nmap{'<leader>c', ':copen<cr>'}
nmap{'<leader>x', ':cclose<cr>'}

-- toggle highlight last search
nmap{'<leader>n', ':set hlsearch!<cr>'}

-- Terminal: ESC to exit terminal mode
vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]], opts_noremap_silent)

-- LSP related mappings
nmap {'<leader>lf', '<CMD>Format<CR>', opts_noremap_silent}

-- Shamelessly copying from the primeagen
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- delete/paste without overwriting the current register
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Code runner mappings
nmap {'<F8>', '<CMD> !python %:S <CR>'}

-- plain run a single file: <localleader>er
vim.api.nvim_create_autocmd("FileType", { pattern = "python", command = "nnoremap <buffer> <localleader>er <ESC> :belowright split<CR>:te LOCAL=true python % <CR>" })
vim.api.nvim_create_autocmd("FileType", { pattern = "rust", command = "nnoremap <buffer> <localleader>er <ESC> :belowright split<CR>:te rustc % && ./%:t:r <CR>" })
vim.api.nvim_create_autocmd("FileType", { pattern = "cpp", command = "nnoremap <buffer> <localleader>er <ESC> :w <CR> :belowright split<CR>:te g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DLOCAL -O2 -o %:t:r % && ./%:t:r <CR>" })

-- plain run a single file reading from a inp file: <localleader>ee
vim.api.nvim_create_autocmd("FileType", { pattern = "python", command = "nnoremap <buffer> <localleader>ee <ESC> :belowright split<CR>:te LOCAL=true python % < inp <CR>" })
vim.api.nvim_create_autocmd("FileType", { pattern = "rust", command = "nnoremap <buffer> <localleader>ee <ESC> :belowright split<CR>:te rustc % && ./%:t:r < inp <CR>" })
vim.api.nvim_create_autocmd("FileType", { pattern = "cpp", command = "nnoremap <buffer> <localleader>ee <ESC> :w <CR> :belowright split<CR>:te g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DLOCAL -O2 -o %:t:r % && ./%:t:r < inp <CR>" })
