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
Plug 'tpope/vim-dispatch'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
" fuzzy file searching
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim' 

" appearance related
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'sheerun/vim-polyglot'

" latex related
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

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

" temporary

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
let maplocalleader = "\\"

" Fast saving
nmap <leader>w :w!<cr>

" use system clipboard register to copy and paste
set clipboard=unnamed,unnamedplus

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
let g:airline_theme='night_owl'
"set termguicolors
let ayucolor="dark"
colorscheme onedark

" line number
set number
set relativenumber

" indentation, text, tab related
set smartindent
set autoindent

set tabstop=4
set shiftwidth=4

" use spaces instead of tab
set expandtab

" wrap lines with a margin of 8
set wrap
set wrapmargin=8
set linebreak

set autoread


" code folding settings
set foldmethod=syntax "fold based on indent
set foldlevelstart=99
set foldnestmax=10 "deepest fold is 10 levels
set nofoldenable "don't fold by default
set foldlevel=1

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_powerline_fonts=1
"let g:airline#extensions#tabline#left_sep='>'
"let g:airline#extensions#tabline#left_alt_sep='>'
" enable code folding
" set foldmethod=indent

:let $CXXFLAGS='-std=c++0x -Wall -pedantic'
" executing scripts
augroup rungroup
  autocmd!
    "autocmd BufRead,BufNewFile *.go nnoremap <F5> :exec '!go run' shellescape(@%, 1)<cr>
  autocmd FileType python let b:dispatch = 'python3 %'
  autocmd BufRead,BufNewFile *.py map <buffer> <silent> <leader>r :w<CR>:Dispatch<CR>

  autocmd BufRead,BufNewFile *.py map <buffer> <F9> :w<CR>:exec '!clear;python3' shellescape(@%, 1)<CR>
  " autocmd BufRead,BufNewFile *.py map <buffer> <F9> :w<CR>:!clear;python3 %<CR>
  autocmd BufRead,BufNewFile *.py imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

  "autocmd filetype cpp nnoremap <F9> :w<CR> :!clear<CR> :!g++ % -o %< && %<<CR>
  autocmd BufRead,BufNewFile *.cpp map <buffer> <F9> :w<CR>: !g++ -std=c++11 -Dtrifiasco % -o %:r && ./%:r <CR>
  autocmd BufRead,BufNewFile *.cpp imap <buffer> <F9> <esc>:w<CR>:!g++ -std=c++11 % -o %:r && ./%:r <CR>
augroup END


" fzf related settings

if isdirectory(".git")
  " if in a git project, use :GFiles
  nmap <silent> <leader>t :GitFiles --cached --others --exclude-standard<cr>
else
        " otherwise, use :FZF
  nmap <silent> <leader>t :FZF<cr>
endif

nmap <silent> <leader>f :Ag<cr>
nmap <silent> <leader>b :Buffers<cr>

let g:fzf_preview_window = ['right:50%', '?']
" let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }


" fugitive related settings
nmap <silent> <leader>gs :Gstatus<cr>
nmap <silent> <leader>gb :Gblame<cr>
nmap <silent> <leader>gv :Gvdiff<cr>


autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'
let g:vimtex_compiler_latexmk = { 
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
