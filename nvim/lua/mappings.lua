--[[
   this file will contain keybindings

   api to set keybindings is - vim.api.nvim_set_keymap
]]

local map = vim.api.nvim_set_keymap


-- map the leader key
vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

-- remap esc to <kj>
map('i', 'kj', '<esc>', {})

-- util methods for mappings
local function nnoremap(left, right)
    map('n', left, right, { noremap = true })
end
local function vnoremap(left, right)
    map('v', left, right, { noremap = true })
end

-- fast saving
nnoremap('<leader>w', ':w!<cr>')
-- closes a buffer
nnoremap('<localleader>q', ':bd<cr>')
-- opens quickfix list
nnoremap('<localleader>c', ':copen<cr>')
-- closes quickfix list
nnoremap('<localleader>x', ':cclose<cr>')

-- toggle highlight last search
nnoremap('<leader>n', ':set hlsearch!<cr>')

--> Plugins related mappings

--> nvim-tree
-- Find is more useful than toggle. Need to check if both can be configured with one keybinding
nnoremap('<C-n>', ':NvimTreeToggle<CR>')
-- local nvim_tree = require('nvim-tree')
-- map('n', "<C-m>", [[<CMD>lua nvim_tree.win_open() ? nvim_tree.toggle() : nvim_tree.<CR>]], {noremap = true})
-- nnoremap('<C-n>', ':NvimTreeToggle<CR>')

--> Navigator - vim-tmux-navigator
local opts = { noremap = true, silent = true }

map('n', "<C-h>", "<CMD>lua require('Navigator').left()<CR>", opts)
map('n', "<C-k>", "<CMD>lua require('Navigator').up()<CR>", opts)
map('n', "<C-l>", "<CMD>lua require('Navigator').right()<CR>", opts)
map('n', "<C-j>", "<CMD>lua require('Navigator').down()<CR>", opts)
map('n', "<C-\\>", "<CMD>lua require('Navigator').previous()<CR>", opts)


--> telescope - finder, grep, buffers
map('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
-- need to experiement on fild_files and git_files
map('n', '<leader>t', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], opts)
map('n', '<leader>f', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)

-- need to check the following mappings if I actually need them or not
-- map('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
-- map('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
-- map('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
-- map('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
-- map('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
-- map('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })


--> fugitive - git stuff
map('n', '<leader>gs', '<CMD> Git<CR>', opts)
map('n', '<leader>gb', '<CMD> Git blame<CR>', opts)
map('n', '<leader>gv', '<CMD> Gvdiffsplit<CR>', opts)

-- rungroup
-- nnoremap('n', '<leader>r', ":update<CR>:exec '!python3' shellescape(@%, 1)<CR>")
vim.cmd[[
augroup rungroup
  autocmd!
    "autocmd BufRead,BufNewFile *.go nnoremap <F5> :exec '!go run' shellescape(@%, 1)<cr>
  " autocmd FileType python let b:dispatch = 'python3 %'
  " autocmd BufRead,BufNewFile *.py map <buffer> <silent> <leader>r :update<CR>:Dispatch<CR>

  autocmd BufRead,BufNewFile *.py map <buffer> <silent> <leader>r :update<CR>:exec '!python3' shellescape(@%, 1)<CR>
  " " autocmd BufRead,BufNewFile *.py map <buffer> <F9> :w<CR>:!clear;python3 %<CR>
  " autocmd BufRead,BufNewFile *.py imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

  "autocmd filetype cpp nnoremap <F9> :w<CR> :!clear<CR> :!g++ % -o %< && %<<CR>
  " autocmd BufRead,BufNewFile *.cpp map <buffer> <F9> :w<CR>: !g++ -std=c++11 -Dtrifiasco % -o %:r && ./%:r <CR>
  " autocmd BufRead,BufNewFile *.cpp imap <buffer> <F9> <esc>:w<CR>:!g++ -std=c++11 % -o %:r && ./%:r <CR>
augroup END
]]
