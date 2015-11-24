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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let g:airline_powerline_fonts=1
let g:bufferline_echo = 0

" let Vundle manage Vundle
" " required! 
Plugin 'gmarik/vundle'
"Plugin 'Lokaltog/powerline'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'hynek/vim-python-pep8-indent'
"Plugin 'jmcantrell/vim-virtualenv'
Plugin 'cwood/vim-django'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'klen/python-mode'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Yggdroot/indentLine'
Plugin 'jgdavey/tslime.vim'
"Plugin 'bling/vim-airline'
Plugin 'edkolev/promptline.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'jonathanfilip/vim-lucius'
"Plugin 'edkolev/tmuxline.vim'
Plugin 'nHurD/vim-hybrid'

call vundle#end()

filetype plugin indent on     " required!
autocmd FileType python setlocal completeopt-=preview

set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
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

