set nocompatible

" Vundle plugins
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
Plugin 'rainux/vim-desert-warm-256'
Bundle 'Valloric/YouCompleteMe'
Bundle 'wincent/Command-T'
" Bundle 'vim-scripts/taglist.vim'
filetype plugin indent on " required

set laststatus=2 " needed for airline
" Colors
syntax enable
colorscheme desert-warm-256

map <F8> :TlistToggle<CR>
map <C-f> :CommandT<CR>

" Formatting
set tabstop=4
set shiftwidth=4
set expandtab
set cinoptions=N-s

" Splits
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
