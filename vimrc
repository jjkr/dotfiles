"""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""
set nocompatible  " Vim mode

"""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
filetype plugin indent on

"""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""
Bundle 'scrooloose/nerdtree'
map <F4> :NERDTreeToggle<CR>
" Close NERDTree window if it's the only one left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""
syntax enable
Bundle 'rainux/vim-desert-warm-256'
colorscheme desert-warm-256

"""""""""""""""""""""""""""""
" Tagging/Completion
"""""""""""""""""""""""""""""
Bundle 'vim-scripts/taglist.vim'
map <F8> :TlistToggle<CR>
Bundle 'Valloric/YouCompleteMe'
Bundle 'wincent/Command-T'
map <C-f> :CommandT<CR>

"""""""""""""""""""""""""""""
" Formatting
"""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set expandtab
set cinoptions=N-s

"""""""""""""""""""""""""""""
" Splits
"""""""""""""""""""""""""""""
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
