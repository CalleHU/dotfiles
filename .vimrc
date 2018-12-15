let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_enable_diagnostic_highlighting = 0

let g:lightline = {
      \ 'colorscheme': 'breezy',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set nocompatible
filetype off
syntax on
let python_highlight_all=1
set encoding=utf-8
set clipboard=unnamedplus
set splitbelow
set splitright
set noshowmode
set ignorecase
set smartcase
set hidden

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set linebreak
set expandtab

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Gundo'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'nvie/vim-flake8'
Plugin 'w0rp/ale'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'daviesjamie/vim-base16-lightline'
Plugin 'fneu/breezy'
Plugin 'tmhedberg/SimpylFold'

Plugin 'Valloric/YouCompleteMe'

call vundle#end()

set background=light
colorscheme breezy
highlight BadWhitespace ctermbg=darkgreen guibg=darkgreen
let g:ale_set_highlights = 0
filetype plugin indent on

set foldmethod=indent
set foldlevel=99

let mapleader = ","
inoremap jk <esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <space> za

nnoremap <leader>b :buffers<CR>:buffer<space>
nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>:!pkill -HUP mupdf<CR> |
nnoremap <leader>v :!mupdf -r 110 %:r.pdf &<CR><CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

set laststatus=2

au BufNewFile,BufRead *.py 
    \ set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 |
    \ set expandtab autoindent fileformat=unix

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
