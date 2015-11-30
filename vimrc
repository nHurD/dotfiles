syntax on
set modeline


"au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nu
set nocompatible              " be iMproved
filetype off                  " required!


let g:airline_powerline_fonts=1
let g:bufferline_echo = 0

call plug#begin('~/.vim/plugged')
"Plug 'Lokaltog/powerline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'hynek/vim-python-pep8-indent'
"Plug 'jmcantrell/vim-virtualenv'
Plug 'cwood/vim-django'
"Plug 'Shougo/neocomplete.vim'
Plug 'klen/python-mode'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Yggdroot/indentLine'
Plug 'jgdavey/tslime.vim'
"Plug 'bling/vim-airline'
Plug 'edkolev/promptline.vim'
Plug 'junegunn/goyo.vim'
Plug 'jonathanfilip/vim-lucius'
"Plug 'edkolev/tmuxline.vim'
Plug 'bling/vim-airline'
Plug 'nHurD/vim-hybrid'

call plug#end()

filetype plugin indent on     " required!
autocmd FileType python setlocal completeopt-=preview

set laststatus=2
set noshowmode
"let g:hybrid_use_Xresources = 1
let g:hybrid_no_term_bg = 1
colorscheme hybrid
"let g:lucius_no_term_bg = 1
"colorscheme lucius
"LuciusBlack

set guioptions-=r
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore = ['\.pyc$']
set guifont=Mensch\ for\ Powerline\ 9
set guioptions-=L
set guioptions-=m
set guioptions-=T
set cursorline

let g:django_projects = expand('~')
let g:django_project_container = 'src/greenphire/'
let g:django_activate_virtualenv = 1 "Try to activate the associated virtualenv
let g:django_activate_nerdtree = 1 "Try to open nerdtree at the project root.

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:syntastic_python_pylint_post_args='--disable=E1101'

" switch between buffers
nnoremap <silent> <space>h :bprevious<CR>
nnoremap <silent> <space>l :bnext<CR>
" toggle last two buffers
nnoremap <space>u <c-^>

let g:pymode_warnings=0
let g:pymode_lint=0

let g:goyo_margin_top=0
let g:goyo_margin_bottom=0

"
" Tslime.vim
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

