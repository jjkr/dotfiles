set nocompatible

" Vundle plugins
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
"Plugin 'vim-desert-warm-256'
Plugin 'Valloric/YouCompleteMe'
Plugin 'wincent/Command-T'
filetype plugin indent on

" General
set hidden " allow unsaved background buffers and remember their marks
set history=10000
set wildmenu " bash style completion for files/buffers
set foldmethod=syntax
set number
set ruler " always display footer
set nohlsearch " don't highlight search after it is over
set incsearch " do highlight currently selected search term
set showmatch " show parens match
set ignorecase smartcase
set showcmd " show incomplete commands
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Colors
set t_Co=256
syntax enable
set background=dark

" Formatting
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set nowrap
set cinoptions=N-s

" Plugins
""""""""""""""""""""""
" Airline
set laststatus=2 " make room in the statusbar
let g:airline_powerline_fonts=1
let g:airline_theme='tomorrow'

let g:CommandTMaxHeight = 8

" Remaps
""""""""""""""""""""""
map <F8> :TlistToggle<CR>
map <C-f> :CommandT<CR>
" Splits
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
" Tabs
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tn  :tabnew<CR>
nnoremap td  :tabclose<CR>

" GUI
set guioptions=aic
if has("gui_running")
  colorscheme base16-tomorrow
  set guifont=Inconsolata\ for\ Powerline\ 12
endif
