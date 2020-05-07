set nocompatible

" vim-plug {{{

" install vim-plug on demand
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kien/ctrlp.vim'
Plug 'milkypostman/vim-togglelist'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/taglist.vim'
Plug 'fatih/vim-go'
Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'
call plug#end()

" }}}

" General {{{

set hidden " allow unsaved background buffers and remember their marks
set history=10000
set wildmenu " bash style completion for files/buffers
set foldmethod=syntax
set foldlevelstart=99
set number
set ruler " always display footer
set showmatch " show parens match
set ignorecase smartcase
set showcmd " show incomplete commands
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set mouse=a
"set ttymouse=xterm2
set guioptions=aic " no menu bar in gvim
set modelines=1 " allow vim modelines on last line of file
set scrolloff=3 " keep 3 lines above and below cursor
" significant trailing witespace
set fillchars=fold:\ 
let mapleader = ' '

set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

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
highlight LineNr ctermfg=243 cterm=NONE
highlight TabLineFill ctermbg=234 cterm=NONE
highlight Visual ctermbg=236 cterm=NONE
highlight ColorColumn ctermbg=235 cterm=NONE
highlight Folded ctermfg=192 ctermbg=235 cterm=NONE
highlight FoldColumn ctermfg=154 ctermbg=235 cterm=NONE
highlight Search ctermbg=3 ctermfg=Black cterm=NONE
highlight Pmenu ctermfg=Black ctermbg=Blue cterm=None
highlight PmenuSel ctermfg=Black ctermbg=White cterm=None
highlight DiffAdd ctermbg=235 cterm=None
" :highlight DiffDelete ctermbg=5 cterm=None
highlight DiffDelete ctermfg=88 ctermbg=235 cterm=None
highlight DiffChange ctermbg=235 cterm=None
highlight DiffText ctermbg=17 cterm=None
highlight SignColumn ctermbg=Black cterm=NONE
highlight YcmWarningSign ctermfg=235 ctermbg=11 cterm=None
highlight YcmErrorSign ctermfg=235 ctermbg=160 cterm=None
highlight YcmWarningSection ctermbg=235 cterm=None
highlight YcmErrorSection ctermbg=52 cterm=None

" }}}

" Formatting {{{

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set nowrap

" }}}

" Filetype specific {{{

autocmd FileType c,cpp,cc,h,hpp,rust setlocal colorcolumn=101
" Jump to header
autocmd FileType c,cpp,cc,h,hpp nnoremap <leader>ah :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
autocmd FileType c,cpp,cc,h,hpp nnoremap <leader>an :e %:p:s,\v(.*)\.h$,\1.X123X,:s,\v(.*)\.C\+\+,\1.h,:s,\v(.*)\.X123X$,\1.C++,:s,\vinc/(.*)\.C\+\+$,src/\1.C++,:s,\vsrc/(.*)\.h$,inc/\1.h,<CR>

autocmd Filetype ruby,erb,javascript,json,html,css,scss,xml,xsd,proto,elixir setlocal shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2 colorcolumn=101
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=81

autocmd FileType asm silent SyntasticToggleMode

autocmd BufNewFile,BufRead *.C++ set filetype=cpp
autocmd BufNewFile,BufRead *.ejs set filetype=html

" Stretch preview/quickfix windows
autocmd FileType qf wincmd J
autocmd FileType gitcommit wincmd K

" }}}

" Plugins {{{

" The Silver Searcher for fast grep and fuzzy file search
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
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Python mode
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<Tab>'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let g:ycm_disable_for_files_larger_than_kb=200
set completeopt-=preview

" CtrlP
let g:ctrlp_map = '<c-f>'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '[\/]\.(git|hg|svn)$',
    \ 'file': '\.(swp|exe|so|dll|bin|zip|gz|bz2|tar|o)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
let g:ctrlp_root_markers = ['.ctrlp']

" Go
let g:go_bin_path = "/usr/bin"
let g:go_disable_autoinstall = 1

" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-S-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-S-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-S-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger       = "<C-g>"
let g:UltiSnipsListSnippets        = "<F3>"
let g:UltiSnipsJumpForwardTrigger  = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<C-S-l>"
let g:UltiSnipsEditSplit           = "vertical"

let g:mustache_abbreviations = 1

let g:toggle_list_no_mappings = 1

let g:localvimrc_ask = 0

let g:EclimCompletionMethod = 'omnifunc'

let g:typescript_compiler_options = '--target es2015'
let g:syntastic_javascript_checkers = ['eslint']

" }}}

" Remaps {{{
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>s :split<CR>
nnoremap <leader>v :vsplit<CR>
" fugative
nnoremap <leader>gs :Gstatus<CR>
command GdiffInTab tabedit %|Gdiff
nnoremap <leader>gd :GdiffInTab<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gr :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gps :Dispatch git push<CR>
nnoremap <leader>gpl :Dispatch git pull<CR>
nnoremap <leader>m :Make<CR>
nnoremap <leader>M :Make!<CR>
nnoremap <leader>n :Dispatch<CR>
nnoremap <leader>N :Dispatch!<CR>
nnoremap <leader>aa :A<CR>
nnoremap <leader>at :A<CR>
noremap <leader>k :Autoformat<CR>
nnoremap <M-s> :w<CR>
inoremap <M-s> <ESC>:w<CR>i
" YouCompleteMe
nnoremap <leader>yt :YcmCompleter GetType<CR>
nnoremap <leader>yd :YcmCompleter GetDoc<CR>
" Tabs
nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap tq :tabclose<CR>
nnoremap <script> <silent> <leader>c :call ToggleQuickfixList()<CR>
" highlight word under cursor
nnoremap <leader>j :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" toggle search highlight
nnoremap <leader>sh :set hlsearch! hlsearch?<CR>
" toggle paste mode
nnoremap <leader>sp :set paste!<BAR>set paste?<CR>
" toggle number mode
nnoremap <leader>sn :set number! number?<CR>

" silver searcher
nnoremap <leader>g :Ag<SPACE>
" grep for word under cursor
nnoremap <leader>f :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" toggle spell check
map <F6> :setlocal spell! spelllang=en_us<CR>
map <leader>ss :setlocal spell! spelllang=en_us<CR>
map <F8> :TlistToggle<CR>
map <F9> :NERDTreeToggle<CR>
" generate tags
map <F12> :!ctags -V -R --exclude=build --exclude=hwbuild --exclude=3rdParty --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

" BlackPearl logs
command -nargs=+ Bpgrep enew | 0read ! bpgrep "'<args>'" #

" Splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" }}}

" vim:foldmethod=marker:foldlevel=0
