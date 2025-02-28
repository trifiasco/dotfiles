--[[
   this file will contain keybindings
   api to set keybindings is - vim.api.nvim_set_keymap
]]

-- Note: two ways to setup keymap
-- vim.keymap.set - default opts = {noremap = true}
-- vim.api.nvim_set_keymap - no default opts
local maps = require('trifiasco.utils.maps')
local imap = maps.imap
local nmap = maps.nmap

local opts_noremap_silent = { noremap = true, silent = true }
local opts_noremap = { noremap = true, silent = true }


-- Things I can't live without
imap{'kj', '<ESC>'}
nmap {'<leader>w', ':w!<CR>'}
nmap  {';', ':'}
nmap{'<leader>q', ':bd!<CR>'}

-- reload stuff that almost never works
nmap{'<leader>r', ':Lazy reload '}
nmap{'<leader><leader>x', ': source %<CR>'}

-- opens/close quickfix list
nmap{'<leader>c', ':copen<cr>'}
nmap{'<leader>x', ':cclose<cr>'}

-- toggle highlight last search
nmap{'<leader>n', ':set hlsearch!<cr>'}


--> Navigator - vim-tmux-navigator
nmap {"<C-h>", "<CMD>lua require('Navigator').left()<CR>", opts_noremap_silent}
nmap {"<C-k>", "<CMD>lua require('Navigator').up()<CR>", opts_noremap_silent}
nmap {"<C-l>", "<CMD>lua require('Navigator').right()<CR>", opts_noremap_silent}
nmap {"<C-j>", "<CMD>lua require('Navigator').down()<CR>", opts_noremap_silent}
nmap {"<C-\\>", "<CMD>lua require('Navigator').previous()<CR>", opts_noremap_silent}

-- -- Neotree Keymaps
nmap {"<C-n>", "<cmd> Neotree filesystem reveal float toggle<CR>", opts_noremap}

-- Telescope Keymaps
local builtin = require('telescope.builtin')
nmap {'<leader>t', builtin.find_files, {}}
nmap {'<leader>f', builtin.live_grep, {}}
nmap {'<leader>b', builtin.buffers, {}}
nmap {'<leader>h', builtin.help_tags, {}}


--> fugitive - git stuff
nmap {'<leader>gs', '<CMD> Git<CR>', opts_noremap_silent}
nmap {'<leader>gb', '<CMD> Git blame<CR>', opts_noremap_silent}
nmap {'<leader>gv', '<CMD> Gvdiffsplit<CR>', opts_noremap_silent}
-- 
-- nmap {'<leader>p', [[<cmd>lua require('nabla').popup()<CR>]], opts_noremap_silent}
-- 
-- -- telekasten keymaps
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


-- -- Terminal related
vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]], opts_noremap_silent)
-- Can directly map to keys, but better to expose the commands as a vim user command
-- Close Vs Exit: Close doesn't kill the process, Exit does
vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })
vim.api.nvim_create_user_command('FTermClose', require('FTerm').close, { bang = true })
vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })
vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })
--
nmap {'<localleader>tt', '<CMD>FTermToggle<CR>', opts_noremap_silent}
nmap {'<localleader>tx', '<CMD>FTermExit<CR>', opts_noremap_silent}
nmap {'<localleader>tc', '<CMD>FTermClose<CR>', opts_noremap_silent}

-- TODO: scratch terminal for ephimeral build commands. Possibilities are endless
-- TODO: custom terminal to attach things like btop, lazygit etc.


-- LSP related mappings
-- :Format is an custom user-command. It's basically calling vim.lsp.buf.format()
nmap {'<leader>lf', '<CMD>Format<CR>', opts_noremap_silent}

-- Shamelessly copying from the primeagen
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- delete/paste without overwriting the current register
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])


-- Code runner mappings
-- Run types:
-- 1. SingleRun - run the current file. Determine the language from the file extension
-- cpp: 
-- python: venv detection? ipython?
-- go:
-- rust:
-- 2. TestRun - run the test file. Determine the language from the file extension
-- 3. Generic command run: like localdev.sh, makefile targets etc
-- Generic considerations:
-- scratch terminals, tmux panes, scratch buffers, quickfix list

nmap {'<F8>', '<CMD> !python % <CR>', opts}

-- plain run a single file: <localleader>er
vim.api.nvim_create_autocmd("FileType", { pattern = "python", command = "nnoremap <buffer> <localleader>er <ESC> :belowright split<CR>:te LOCAL=true python % <CR>" })
vim.api.nvim_create_autocmd("FileType", { pattern = "rust", command = "nnoremap <buffer> <localleader>er <ESC> :belowright split<CR>:te rustc % && ./%:t:r <CR>" })
vim.api.nvim_create_autocmd("FileType", { pattern = "cpp", command = "nnoremap <buffer> <localleader>er <ESC> :w <CR> :belowright split<CR>:te g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DLOCAL -O2 -o %:t:r % && ./%:t:r <CR>" })

-- plain run a single file reading from a inp file: <localleader>ee
vim.api.nvim_create_autocmd("FileType", { pattern = "python", command = "nnoremap <buffer> <localleader>ee <ESC> :belowright split<CR>:te LOCAL=true python % < inp <CR>" })
vim.api.nvim_create_autocmd("FileType", { pattern = "rust", command = "nnoremap <buffer> <localleader>ee <ESC> :belowright split<CR>:te rustc % && ./%:t:r < inp <CR>" })
vim.api.nvim_create_autocmd("FileType", { pattern = "cpp", command = "nnoremap <buffer> <localleader>ee <ESC> :w <CR> :belowright split<CR>:te g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DLOCAL -O2 -o %:t:r % && ./%:t:r < inp <CR>" })

nmap {'<leader><leader>s', '<CMD>OverseerToggle!<CR>', opts}
nmap {'<leader><leader>q', '<CMD>OverseerQuickAction<CR>', opts}

nmap {'<leader><leader>r', '<CMD>SingleRun<CR>', opts}
nmap {'<leader><leader>w', '<CMD>WatchSingleRun<CR>', opts}



