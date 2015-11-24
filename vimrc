syntax on
set modeline

" Vundle Stuff
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set nocompatible              " be iMproved
filetype off                  " required!

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
"Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'bling/vim-airline'
"Plug 'edkolev/tmuxline.vim'
Plug 'nHurD/vim-hybrid'

" Python Stuff
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}
Plug 'klen/python-mode', {'for': 'python'}
Plug 'lambdalisue/vim-django-support', {'for': ['python', 'html']}

" Generic Coding Stuff
Plug 'Shougo/neocomplete.vim'
Plug 'scrooloose/syntastic', {'for': ['python', 'html', 'latex', 'json', 'rst']}
Plug 'Yggdroot/indentline', {'for': ['python', 'clojure']}

" Clojure Stuff
Plug 'guns/vim-clojure-static', {'for': 'clojure'}
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'guns/vim-clojure-highlight', {'for': 'clojure'}
Plug 'luochen1990/rainbow', {'for': 'clojure'}

" Tmux integration
Plug 'jgdavey/tslime.vim'
Plug 'christoomey/vim-tmux-navigator'


call plug#end()

filetype plugin indent on     " required!
autocmd FileType python setlocal completeopt-=preview

" Powerline
let g:Powerline_symbols = 'fancy'
set noshowmode
set laststatus=2

" Generic UI stuff
set background=dark
colorscheme hybrid
set guifont=Monaco\ for\ Powerline:h10
set guioptions-=r
set guioptions-=L
set cursorline
set nu

" NERDTree Options
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeWinPos = "left"

" Neocomplete options
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#force_overwrite_completefunc = 1

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"
" Python
let g:pymode_warning=0
let g:pymode_lint=0
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace() # XXX breakpoint'

let g:syntastic_python_pylint_post_args='--disable=E1101'
let g:syntastic_python_flake8_post_args='--max-complexity=10'

" Generic stuff
set colorcolumn=80

" Airilne
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1

" Tslime.vim
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

" Switch between buffers
nnoremap <silent> <space>h :bprevious<CR>
nnoremap <silent> <space>l :bnext<CR>
nnoremap <space>u <c-^>

" Clojure
let g:clojure_fuzzy_indent = 1
let g:clojure_align_subforms = 1
let g:rainbow_active = 0
autocmd FileType clojure :RainbowToggle
