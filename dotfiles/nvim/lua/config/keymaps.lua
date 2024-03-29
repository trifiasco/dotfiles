--[[
   this file will contain keybindings
   api to set keybindings is - vim.api.nvim_set_keymap
]]

-- Note: two ways to setup keymap
-- vim.keymap.set - default opts = {noremap = true}
-- vim.api.nvim_set_keymap - no default opts
local maps = require('utils.maps')
local imap = maps.imap
local nmap = maps.nmap
local map = vim.api.nvim_set_keymap


-- Things I can't live without
imap{'kj', '<ESC>'}
nmap {'<leader>w', ':w!<CR>'}
nmap  {';', ':'}
nmap{'<leader>q', ':bd!<CR>'}

nmap{'<leader>r', ':Lazy<CR>'}

nmap{'<leader><leader>x', ': source %<CR>'}
-- opens quickfix list
nmap{'<leader>c', ':copen<cr>'}
-- closes quickfix list
nmap{'<leader>x', ':cclose<cr>'}

-- toggle highlight last search
nmap{'<leader>n', ':set hlsearch!<cr>'}

--> Plugins related mappings

--> Navigator - vim-tmux-navigator
local opts = { noremap = true, silent = true }

vim.keymap.set('n', "<C-h>", "<CMD>lua require('Navigator').left()<CR>", opts)
vim.keymap.set('n', "<C-k>", "<CMD>lua require('Navigator').up()<CR>", opts)
vim.keymap.set('n', "<C-l>", "<CMD>lua require('Navigator').right()<CR>", opts)
vim.keymap.set('n', "<C-j>", "<CMD>lua require('Navigator').down()<CR>", opts)
vim.keymap.set('n', "<C-\\>", "<CMD>lua require('Navigator').previous()<CR>", opts)

-- -- Neotree Keymaps
vim.api.nvim_set_keymap('n', '<C-n>', '<cmd> Neotree filesystem reveal float toggle<CR>', {noremap = true})

-- Telescope Keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>t', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})


--> fugitive - git stuff
vim.keymap.set('n', '<leader>gs', '<CMD> Git<CR>', opts)
vim.keymap.set('n', '<leader>gb', '<CMD> Git blame<CR>', opts)
vim.keymap.set('n', '<leader>gv', '<CMD> Gvdiffsplit<CR>', opts)
-- 
-- vim.keymap.set('n', '<leader>p', [[<cmd>lua require('nabla').popup()<CR>]], opts)
-- 
-- -- telekasten keymaps
vim.keymap.set('n', '<leader>zf', [[<cmd>lua require('telekasten').find_notes()<CR>]], opts)
vim.keymap.set('n', '<leader>zd', [[<cmd>lua require('telekasten').find_daily_notes()<CR>]], opts)
vim.keymap.set('n', '<leader>zw', [[<cmd>lua require('telekasten').find_weekly_notes()<CR>]], opts)
vim.keymap.set('n', '<leader>zg', [[<cmd>lua require('telekasten').search_notes()<CR>]], opts)

vim.keymap.set('n', '<leader>zT', [[<cmd>lua require('telekasten').goto_today()<CR>]], opts)
vim.keymap.set('n', '<leader>zW', [[<cmd>lua require('telekasten').goto_thisweek()<CR>]], opts)

vim.keymap.set('n', '<leader>zn', [[<cmd>lua require('telekasten').new_note()<CR>]], opts)
vim.keymap.set('n', '<leader>zN', [[<cmd>lua require('telekasten').new_template_note()<CR>]], opts)

vim.keymap.set('n', '<leader>zt', [[<cmd>lua require('telekasten').toggle_todo()<CR>]], opts)

vim.keymap.set('n', '<leader>zr', [[<cmd>lua require('telekasten').rename_note()<CR>]], opts)
vim.keymap.set('n', '<leader>za', [[<cmd>lua require('telekasten').show_tags()<CR>]], opts)
vim.keymap.set('n', '<leader>zb', [[<cmd>lua require('telekasten').show_backlinks()<CR>]], opts)
vim.keymap.set('n', '<leader>zF', [[<cmd>lua require('telekasten').find_friends()<CR>]], opts)
vim.keymap.set('n', '<leader>zz', [[<cmd>lua require('telekasten').follow_link()<CR>]], opts)

vim.keymap.set('n', '<leader>z', [[<cmd>lua require('telekasten').panel()<CR>]], opts)


-- -- Terminal related
vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]], opts)
-- Can directly map to keys, but better to expose the commands as a vim user command
-- Close Vs Exit: Close doesn't kill the process, Exit does
vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })
vim.api.nvim_create_user_command('FTermClose', require('FTerm').close, { bang = true })
vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })
vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })
--
vim.keymap.set('n', '<localleader>t', '<CMD>FTermToggle<CR>', opts)
vim.keymap.set('n', '<localleader>fx', '<CMD>FTermExit<CR>', opts)
vim.keymap.set('n', '<localleader>fc', '<CMD>FTermClose<CR>', opts)

-- TODO: scratch terminal for ephimeral build commands. Possibilities are endless
-- TODO: custom terminal to attach things like btop, lazygit etc.


-- LSP related mappings
-- :Format is an custom user-command. It's basically calling vim.lsp.buf.format()
vim.keymap.set('n', '<leader>lf', '<CMD>Format<CR>', opts)

-- Shamelessly copying from primeagen
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

vim.keymap.set('n', '<F8>', '<CMD> !python % <CR>', opts)

-- plain run a single file: <localleader>er
vim.api.nvim_create_autocmd("FileType", { pattern = "python", command = "nnoremap <buffer> <localleader>er <ESC> :belowright split<CR>:te LOCAL=true python % <CR>" })
vim.api.nvim_create_autocmd("FileType", { pattern = "rust", command = "nnoremap <buffer> <localleader>er <ESC> :belowright split<CR>:te rustc % && ./%:t:r <CR>" })
vim.api.nvim_create_autocmd("FileType", { pattern = "cpp", command = "nnoremap <buffer> <localleader>er <ESC> :w <CR> :belowright split<CR>:te g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DLOCAL -O2 -o %:t:r % && ./%:t:r <CR>" })

-- plain run a single file reading from a inp file: <localleader>ee
vim.api.nvim_create_autocmd("FileType", { pattern = "python", command = "nnoremap <buffer> <localleader>ee <ESC> :belowright split<CR>:te LOCAL=true python % < inp <CR>" })
vim.api.nvim_create_autocmd("FileType", { pattern = "rust", command = "nnoremap <buffer> <localleader>ee <ESC> :belowright split<CR>:te rustc % && ./%:t:r < inp <CR>" })
vim.api.nvim_create_autocmd("FileType", { pattern = "cpp", command = "nnoremap <buffer> <localleader>ee <ESC> :w <CR> :belowright split<CR>:te g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DLOCAL -O2 -o %:t:r % && ./%:t:r < inp <CR>" })

vim.keymap.set('n', '<leader><leader>s', '<CMD>OverseerToggle!<CR>', opts)
vim.keymap.set('n', '<leader><leader>q', '<CMD>OverseerQuickAction<CR>', opts)

vim.keymap.set('n', '<leader><leader>r', '<CMD>SingleRun<CR>', opts)
vim.keymap.set('n', '<leader><leader>w', '<CMD>WatchSingleRun<CR>', opts)

vim.api.nvim_set_keymap("i", "<C-y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
