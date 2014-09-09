set nocompatible

" Vundle plugins {{{

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'chriskempson/base16-vim' " color schemes
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'bling/vim-airline' " statusline
"Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe' " auto complete
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic' " multi-language linting
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive' " git wrapper
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'digitaltoad/vim-jade'
Plugin 'marijnh/tern_for_vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'editorconfig/editorconfig-vim'
"Plugin 'klen/python-mode'
"Plugin 'vim-ruby/vim-ruby'
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
set showmatch " show parens match
set ignorecase smartcase
set showcmd " show incomplete commands
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set mouse=a
set ttymouse=xterm2
set guioptions=aic " no menu bar in gvim
set modelines=1 " allow vim modelines on last line of file
set scrolloff=3 " keep 3 lines above and below cursor
let mapleader = ' '

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
highlight ColorColumn ctermbg=235 cterm=NONE
highlight Folded ctermfg=154 ctermbg=235 cterm=NONE
highlight FoldColumn ctermfg=154 ctermbg=235 cterm=NONE
highlight Search ctermbg=3 ctermfg=Black cterm=NONE
highlight Pmenu ctermfg=Black ctermbg=Blue cterm=None
highlight PmenuSel ctermfg=Black ctermbg=White cterm=None
highlight DiffAdd ctermbg=235 cterm=None
" :highlight DiffDelete ctermbg=5 cterm=None
highlight DiffDelete ctermfg=88 ctermbg=235 cterm=None
highlight DiffChange ctermbg=235 cterm=None
highlight DiffText ctermbg=17 cterm=None

" }}}

" Formatting {{{

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set nowrap
set cinoptions=N-s

" }}}

" Filetype specific {{{

autocmd FileType c,cpp,cc,h,hpp setlocal colorcolumn=81
" Jump to header
autocmd FileType c,cpp,cc,h,hpp nnoremap <leader>r :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
" Clang Format
autocmd FileType c,cpp,cc,h,hpp noremap <leader>k :pyf /usr/share/vim/addons/syntax/clang-format-3.6.py<CR>

autocmd Filetype ruby,erb,javascript,json,html,css,scss setlocal shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2 colorcolumn=81
autocmd Filetype erb setlocal shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2 colorcolumn=81
autocmd Filetype javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=81
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=81

autocmd Filetype javascript,json noremap <leader>k :call JsBeautify()<CR>
autocmd Filetype html noremap <leader>k :call HtmlBeautify()<CR>
autocmd Filetype css noremap <leader>k :call CssBeautify()<CR>

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
" let g:airline#extensions#tabline#enabled = 1

" Python mode
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<Tab>'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" CtrlP
let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlP'

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
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>
nnoremap <leader>m :Make<CR>
" highlight word under cursor
nnoremap <leader>j :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
" toggle search highlight
noremap <leader>h :set hlsearch! hlsearch?<CR>
" toggle paste mode
nnoremap <silent> <leader>p :set paste!<BAR>set paste?<CR>
" silver searcher
nnoremap <leader>a :Ag<SPACE>
" grep for word under cursor
nnoremap <leader>f :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
map <leader>k =

" toggle spell check
map <F6> :setlocal spell! spelllang=en_us<CR>
map <F8> :TlistToggle<CR>
map <F9> :NERDTreeToggle<CR>
" generate tags
map <F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q {.,**}/*.{cpp,hpp,h,c,cc}<CR>

" Splits
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
" Tabs
nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap tq :tabclose<CR>

" }}}

" vim:foldmethod=marker:foldlevel=0
