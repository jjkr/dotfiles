set nocompatible

" Vundle plugins
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline' " statusline
Plugin 'chriskempson/base16-vim' " color schemes
Plugin 'Valloric/YouCompleteMe' " auto complete
Plugin 'wincent/Command-T' " fuzzy file search
Plugin 'tpope/vim-fugitive' " git wrapper
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
set guioptions=aic " no menu bar

" Colors and Fonts
set t_Co=256
syntax enable
set background=dark
if has("gui_running")
  set guifont=Inconsolata\ for\ Powerline\ 12
  colorscheme base16-tomorrow
  let g:airline_theme='tomorrow'
else
  let g:airline_theme='simple'
endif

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
let g:CommandTMaxHeight = 8
" let g:airline#extensions#tabline#enabled = 1

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

