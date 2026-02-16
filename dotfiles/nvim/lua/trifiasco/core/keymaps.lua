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

-- telekasten keymaps (will be replaced by obsidian.nvim in Phase 4)
nmap {'<leader>zf', [[<cmd>lua require('telekasten').find_notes()<CR>]], opts_noremap_silent}
nmap {'<leader>zd', [[<cmd>lua require('telekasten').find_daily_notes()<CR>]], opts_noremap_silent}
nmap {'<leader>zw', [[<cmd>lua require('telekasten').find_weekly_notes()<CR>]], opts_noremap_silent}
nmap {'<leader>zg', [[<cmd>lua require('telekasten').search_notes()<CR>]], opts_noremap_silent}
nmap {'<leader>zT', [[<cmd>lua require('telekasten').goto_today()<CR>]], opts_noremap_silent}
nmap {'<leader>zW', [[<cmd>lua require('telekasten').goto_thisweek()<CR>]], opts_noremap_silent}
nmap {'<leader>zn', [[<cmd>lua require('telekasten').new_note()<CR>]], opts_noremap_silent}
nmap {'<leader>zN', [[<cmd>lua require('telekasten').new_template_note()<CR>]], opts_noremap_silent}
nmap {'<leader>zt', [[<cmd>lua require('telekasten').toggle_todo()<CR>]], opts_noremap_silent}
nmap {'<leader>zr', [[<cmd>lua require('telekasten').rename_note()<CR>]], opts_noremap_silent}
nmap {'<leader>za', [[<cmd>lua require('telekasten').show_tags()<CR>]], opts_noremap_silent}
nmap {'<leader>zb', [[<cmd>lua require('telekasten').show_backlinks()<CR>]], opts_noremap_silent}
nmap {'<leader>zF', [[<cmd>lua require('telekasten').find_friends()<CR>]], opts_noremap_silent}
nmap {'<leader>zz', [[<cmd>lua require('telekasten').follow_link()<CR>]], opts_noremap_silent}
nmap {'<leader>z', [[<cmd>lua require('telekasten').panel()<CR>]], opts_noremap_silent}

-- Code runner mappings
nmap {'<F8>', '<CMD> !python % <CR>'}

-- plain run a single file: <localleader>er
vim.api.nvim_create_autocmd("FileType", { pattern = "python", command = "nnoremap <buffer> <localleader>er <ESC> :belowright split<CR>:te LOCAL=true python % <CR>" })
vim.api.nvim_create_autocmd("FileType", { pattern = "rust", command = "nnoremap <buffer> <localleader>er <ESC> :belowright split<CR>:te rustc % && ./%:t:r <CR>" })
vim.api.nvim_create_autocmd("FileType", { pattern = "cpp", command = "nnoremap <buffer> <localleader>er <ESC> :w <CR> :belowright split<CR>:te g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DLOCAL -O2 -o %:t:r % && ./%:t:r <CR>" })

-- plain run a single file reading from a inp file: <localleader>ee
vim.api.nvim_create_autocmd("FileType", { pattern = "python", command = "nnoremap <buffer> <localleader>ee <ESC> :belowright split<CR>:te LOCAL=true python % < inp <CR>" })
vim.api.nvim_create_autocmd("FileType", { pattern = "rust", command = "nnoremap <buffer> <localleader>ee <ESC> :belowright split<CR>:te rustc % && ./%:t:r < inp <CR>" })
vim.api.nvim_create_autocmd("FileType", { pattern = "cpp", command = "nnoremap <buffer> <localleader>ee <ESC> :w <CR> :belowright split<CR>:te g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DLOCAL -O2 -o %:t:r % && ./%:t:r < inp <CR>" })
