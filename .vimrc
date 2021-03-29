" package manager related settings
" <plug-start>

" set internal encoding of vim, needed by coc.nvim
set encoding=utf-8
" set hidden, text edit might fail otherwise, needed by coc.nvim
set hidden

call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

" web related plugins
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-pyright',
  \ 'coc-eslint',
  \ 'coc-prettier'
  \ ]

call plug#end()

" <plug-end>
" coc.nvim related settings
set cmdheight=2
set updatetime=300

set signcolumn=yes "always show signcolumns
 
" use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" use <cr> to confirm completion
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>" 

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Escape and leader keys
:imap kj <Esc>

let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" NerdTree mappings
nnoremap <C-n> :NERDTreeToggle<CR>
" find on tree??
" nnoremap <C-f> :NERDTreeFind<CR>

" no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set belloff=all

" files, backup and undo
set nobackup
set nowb " write backup
set noswapfile

" searching
set ignorecase
" set smartcase - doesn't work(need r&d)

" highlight search results
set hlsearch
" " don't wait for search term to be complete, search on each character
" don't wait for search term to be complete, search on each character
set incsearch

" appearance
syntax enable
set background=dark
colorscheme gruvbox

" line number
set number
set relativenumber

" indentation, text, tab related
set smartindent
set autoindent

set tabstop=2
set shiftwidth=2

" use spaces instead of tab
set expandtab

let g:airline#extensions#tabline#enabled=1
" enable code folding
" set foldmethod=indent
