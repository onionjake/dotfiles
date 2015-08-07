" Setup Vundle
set nocompatible
filetype off

set t_Co=256 " We support 256 colors
set laststatus=2 " Force vim-airline to always display

let g:ycm_always_populate_location_list = 1
let g:airline_powerline_fonts = 1

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

set tabstop=2
set shiftwidth=2
set expandtab

source ~/.vimrc.custom
