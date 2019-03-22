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
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'edkolev/tmuxline.vim'
Plug 'nightsense/vim-crunchbang'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'nightsense/stellarized'
Plug 'nHurD/vim-hybrid'
Plug 'ctrlpvim/ctrlp.vim'


" Python Stuff
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}
Plug 'klen/python-mode', {'for': 'python'}
Plug 'lambdalisue/vim-django-support', {'for': ['python', 'html']}
Plug 'w0rp/ale'

" Generic Coding Stuff
"Plug 'Shougo/neocomplete.vim'
Plug 'Valloric/YouCompleteMe'
"Plug 'neomake/neomake'
"Plug 'scrooloose/syntastic', {'for': ['python', 'html', 'latex', 'json', 'rst']}
Plug 'Yggdroot/indentline', {'for': ['python', 'clojure']}

" Clojure Stuff
Plug 'guns/vim-clojure-static', {'for': 'clojure'}
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'guns/vim-clojure-highlight', {'for': 'clojure'}
Plug 'luochen1990/rainbow', {'for': 'clojure'}

" Tmux integration
Plug 'jgdavey/tslime.vim'
Plug 'christoomey/vim-tmux-navigator'

" C# stuff
Plug 'OmniSharp/omnisharp-vim'

call plug#end()

filetype plugin indent on     " required!
autocmd FileType python setlocal completeopt-=preview

" Powerline
set noshowmode
set laststatus=2

" Generic UI stuff

"if (has("termguicolors"))
" set termguicolors
"endif

set background=dark


"colorscheme hybrid_material
let g:hybrid_no_term_bg = 1
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
let g:airline_theme = 'hybrid'

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

" C#
set completeopt=longest,menuone,preview
let g:OmniSharp_timeout = 5
set previewheight=5

let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}
let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim
"autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
autocmd FileType cs setlocal completeopt-=preview
augroup omnisharp_commands
    autocmd!

    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>


    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END
