let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

let g:lightline = {
      \ 'colorscheme': 'base16',
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
set number relativenumber

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
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
Plugin 'vim-scripts/indentpython.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'daviesjamie/vim-base16-lightline'
Plugin 'fneu/breezy'
Plugin 'tmhedberg/SimpylFold'
Plugin 'rdnetto/YCM-Generator'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/fzf.vim'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:tex_flavor = "latex"

set background=light
colorscheme base16-default-dark
highlight BadWhitespace ctermbg=darkgreen guibg=darkgreen
filetype plugin indent on


let mapleader = "," 
inoremap jk <esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <space> za

nnoremap <leader><space> :Files <CR>
nnoremap <leader>b :Buffers <CR>
nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>:!pkill -HUP mupdf<CR> |
nnoremap <leader>v :!mupdf -r 110 %:r.pdf &<CR><CR>

let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

set laststatus=2

au BufNewFile,BufRead *.py 
    \ set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 |
    \ set expandtab autoindent fileformat=unix

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
