set nocompatible

" Vundle plugins {{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline' " statusline
Plugin 'chriskempson/base16-vim' " color schemes
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe' " auto complete
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic' " multi-language linting
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
"Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive' " git wrapper
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'digitaltoad/vim-jade'
"Plugin 'marijnh/tern_for_vim'
Plugin 'rking/ag.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'klen/python-mode'
call vundle#end()
filetype plugin indent on
" }}}

" General {{{
set hidden " allow unsaved background buffers and remember their marks
set history=10000
set wildmenu " bash style completion for files/buffers
set foldmethod=syntax
set foldlevelstart=99
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
set mouse=a " resize splits, switch tabs and more w/ mouse
set guioptions=aic " no menu bar in gvim
set modelines=1 " allow vim modelines on last line of file
:let mapleader = ','
" }}}

" Colors and Fonts {{{
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
:highlight Pmenu ctermfg=Black ctermbg=Blue cterm=None
:highlight PmenuSel ctermfg=Black ctermbg=White cterm=None
:highlight DiffAdd ctermbg=237 cterm=None
" :highlight DiffDelete ctermbg=5 cterm=None
:highlight DiffDelete ctermbg=237 cterm=None
:highlight DiffChange ctermbg=237 cterm=None
:highlight DiffText ctermbg=17 cterm=None
" }}}

" Formatting {{{
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set nowrap
set cinoptions=N-s
map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format-3.5.py<CR>
imap <C-K> <ESC>:pyf /usr/share/vim/addons/syntax/clang-format-3.5.py<CR>i
" }}}

" Filetype specific {{{
autocmd FileType c,cpp,cc,h,hpp setlocal colorcolumn=81
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
autocmd Filetype ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2 colorcolumn=80
autocmd Filetype erb setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2 colorcolumn=80
autocmd FileType php setlocal colorcolumn=100
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
autocmd FileType python setlocal shiftwidth=4 expandtab tabstop=4 softtabstop=4
autocmd FileType python setlocal colorcolumn=80
autocmd FileType python map <buffer> <F4> :call Flake8()<CR>
autocmd FileType python autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType python set omnifunc=pythoncomplete#Complete
au BufNewFile,BufReadPost *.js setlocal shiftwidth=2 tabstop=2 expandtab
"autocmd FileType js setlocal colorcolumn=80
au BufRead,BufNewFile *.json set filetype=json
" Get rid of search hilighting with ,/
nnoremap <silent> <leader>/ :nohlsearch<CR>
" }}}


" Plugins {{{

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
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
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" Go
let g:go_bin_path = "/usr/bin"
let g:go_disable_autoinstall = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"
" }}}

" Remaps {{{
map <F9> :NERDTreeToggle<CR>
map <F8> :TlistToggle<CR>
"map <F8> :Cmapkeys <Bar> :Cfile %:r <Bar> Cbreak main <Bar> Crun <CR>
" Toggle spellcheck in normal mode
:map <F6> :setlocal spell! spelllang=en_us<CR>
"map <C-f> :CommandT<CR>
map <C-f> :CtrlP<CR>
nnoremap <leader>w :vsplit<CR>
nnoremap <leader>d :Gdiff<CR>
nnoremap <leader>b :Gblame<CR>

nnoremap <leader>r :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
" Force save
cmap w!! w !sudo tee % >/dev/null
" ,p toggles paste mode
nmap <silent> <leader>p :set paste!<BAR>set paste?<CR>
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
" Search
" ,j highlight word under cursor
:nnoremap <leader>j :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
" ,h toggle search highlight
:noremap <leader>h :set hlsearch! hlsearch?<CR>
" Ag
nnoremap <leader>g :Ag<SPACE>
" bind K to grep word under cursor
nnoremap <leader>f :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
