set nocompatible

" Vundle plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline' " statusline
Plugin 'chriskempson/base16-vim' " color schemes
Plugin 'Valloric/YouCompleteMe' " auto complete
Plugin 'wincent/Command-T' " fuzzy file search
Plugin 'tpope/vim-fugitive' " git wrapper
Plugin 'scrooloose/syntastic' " multi-language linting
Plugin 'pangloss/vim-javascript'
"Plugin 'klen/python-mode'
call vundle#end()
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
:let mapleader = ','

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
map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format-3.5.py<CR>
imap <C-K> <ESC>:pyf /usr/share/vim/addons/syntax/clang-format-3.5.py<CR>i

" Plugins
""""""""""""""""""""""
" Airline
set laststatus=2 " make room in the statusbar
let g:airline_powerline_fonts=1
let g:CommandTWildIgnore = 'build/**'
let g:CommandTMaxHeight = 8
" let g:airline#extensions#tabline#enabled = 1
" Python mode
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<Tab>'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0

" Remaps
""""""""""""""""""""""
" map <F8> :TlistToggle<CR>
map <F8> :Cmapkeys <Bar> :Cfile %:r <Bar> Cbreak main <Bar> Crun <CR>
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

