set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)"

Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'preservim/nerdtree'
Plugin 'ycm-core/YouCompleteMe'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

au BufNewFile,BufRead *.js
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=80
    \set expandtab
    \set autoindent
    \set fileformat=unix

set encoding=utf-8
let g:ycm_autoclose_preview_window_after_completion = 1

let python_highlight_all=1
syntax on

" complete html tags
iabbrev </ </<C-X><C-O>
imap <C-Space> <C-X><C-O>

" toggle between html tags
runtime macros/matchit.vim

" add dictionary file
set dictionary+=/home/emad/.vim/dic/dic1.txt

" automatic fold by indent
set foldmethod=indent

" change indention size to 2
set tabstop=2
set softtabstop=2
set shiftwidth=2

" add new line without going to insert mode
nmap <cr> o<Esc>
