execute pathogen#infect()
syntax on
filetype plugin indent on
"colorscheme solarized
"set background=dark
colorscheme zenburn
set ignorecase
filetype indent on
set hidden
set incsearch
set t_Co=256
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set foldmethod=syntax
set hidden
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set tags=tags;
