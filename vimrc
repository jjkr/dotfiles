"""""""""""""""""""""""""
" General
"""""""""""""""""""""""""
set nocompatible " no vi compatibility set first!
execute pathogen#infect()
filetype plugin indent on
set hidden " allow unsaved background buffers and remember their marks
set history=10000
set wildmenu " bash style completion for files/buffers

set number
set ruler " always display footer
set nohlsearch " don't highlight search after it is over
set incsearch " do highlight currently selected search term
set showmatch " show parens match
set ignorecase smartcase
set showcmd " show incomplete commands
syntax enable
set t_CO=256  " 256 colors
colorscheme desert
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

"""""""""""""""""""""""""
" Formatting
"""""""""""""""""""""""""
set tabstop=4 " 4 space tabs
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab " spaces instead of tabs
set autoindent
set nowrap

autocmd FileType make setlocal noexpandtab " tabs in Makefiles
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 " 2 space tabs in ruby
autocmd BufRead *.erb set filetype=eruby
autocmd BufRead *.scss set filetype=scss
autocmd BufRead *.less set filetype=css
autocmd BufRead *.coffee set filetype=coffee
autocmd FileType eruby setlocal ts=2 sts=2 sw=2 " 2 space tabs in erb
autocmd FileType scss setlocal ts=2 sts=2 sw=2 " 2 space tabs in erb
autocmd FileType coffee setlocal ts=2 sts=2 sw=2 " 2 space tabs in erb

"""""""""""""""""""""""""
" Remaps
"""""""""""""""""""""""""
" splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" smart tab (autocomplete)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" no arrows
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
