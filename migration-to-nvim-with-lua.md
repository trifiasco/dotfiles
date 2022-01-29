# Migration notes for switching from vim and vimscript to nvim and lua:

## New Keybindings added in nvim:
-  a buffer `nnoremap('<localleader>q', ':bd<cr>')`
-  nnoremap('<localleader>c', ':copen<cr>')
-  nnoremap('<leader>n', ':set hlsearch!<cr>')
-  Some LSP related mappings are introduced, TODO: need to try them all.

## Updated Keybindings(previous - next):
- <leader>c[s|u] - gc[c] : commenting
- m[a|d|m] - [a|d|r] : nerdtree actions vs nvim tree actions (nvim tree introduces a lot more mapping, TODO: need to try them out)


## TODO:
- Plugins with vimscript: The following plugins are written in vimscript, but no good lua alternatives are found(as of now), NEED TO REPLACE in future:
    - vim-fugitive
    - vim-surround
    - vim gitgutter

- Plugins to checkout:
    - lukas-reineke/indent-blankline.nvim
    - dashboard.nvim : luxury stuff, very low priority
    - toggleterm : popup terminal inside nvim, possible usecase: for git actions
    - Note taking plugins: nabla, neorg
    - nvim-notify: gui styled notification
    - easy-motion type plugins: hop, train etc
    - debugging and testing plugins

- Plugins(added in nvim) that need further exploration:
    - treesitter - textobjects, formatting, playground etc.

- Themes or colorscheme to checkout:
    - sonokai
