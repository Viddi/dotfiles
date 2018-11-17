call plug#begin('~/.vim/plugged')

Plug 'ervandew/supertab' " Tab for autocompletion while in insert mode
Plug 'scrooloose/nerdtree' " Show project structure
Plug 'jiangmiao/auto-pairs' " Automatically open/close pairs
Plug 'tomtom/tcomment_vim' " Better support for commenting code
Plug 'vim-scripts/bufkill.vim' " Delete buffer without closing the window
Plug 'flazz/vim-colorschemes' " More colors
Plug 'airblade/vim-rooter' " Automatically changes working directory to project root
Plug 'airblade/vim-gitgutter' " Show git diff signs
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'romgrk/winteract.vim' " Window management
Plug 'tpope/vim-endwise'
Plug 'sheerun/vim-polyglot'
Plug 'rafaqz/ranger.vim'

" Auto completion
Plug 'Valloric/YouCompleteMe'

" Airline
" Plug 'vim-airline/vim-airline' " Status bar at the bottom
" Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline' " Display open buffers on the status bar
Plug 'edkolev/tmuxline.vim'

" Tags
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

" Erlang
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-tags'

" Elixir
Plug 'slashmili/alchemist.vim' " Elixir integration
Plug 'mattreduce/vim-mix'

call plug#end()

" ========================================================================
"                             Basic Configuration
" ========================================================================
set backspace=indent,eol,start
set encoding=utf-8
set relativenumber
set number
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set splitright " open split on right
set splitbelow " open split below
set incsearch " Highlight search
set ignorecase
set smartcase
set hlsearch
set hidden

autocmd BufEnter * silent! lcd %:p:h " Set working directory to file being opened

let mapleader = ','

map <leader>q :noh<CR>

nmap <leader>x :cclose<CR>

" Save with cltr+s in normal and insert mode
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" Quit with Ctrl+q
map <C-q> <esc>:q<CR>
imap <C-q> <esc>:q:<CR>

" Cycle through buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" Kill buffer and pane
nmap <leader>d :bd<CR>

" Execute most common macro buffer 'q'
map Q @q

" Automatically close scratch preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Gradle files as Groovy
au BufNewFile,BufRead *.gradle setf groovy

" ========================================================================
"                           Themes & colors
" ========================================================================

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

syntax enable
set background=dark

colorscheme dracula

" ========================================================================
"                          Plugin Configuration
" ========================================================================

" SuperTab
let g:SuperTabDefaultCompletionType = '<C-n>'

" NERDTree
map <C-t> :NERDTreeToggle<CR>

let NERDTreeShowHidden = 1

" Close vim if NERDTree is ithe only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" easymotion
map  <leader>e <Plug>(easymotion-bd-w)
nmap <leader>e <Plug>(easymotion-overwin-w)

" Winteract
nmap <leader>w :InteractiveWindow<CR>

" fzf
nmap <leader>b :Buffers<CR>
nmap <leader>t :Files<CR>
" search tags in current buffer
nmap <leader>f :BTags<CR>
" search tags in project
nmap <leader>F :Tags<CR>

let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" Ack
cnoreabbrev Ack Ack!
nnoremap <leader>a :Ack!<Space>
nnoremap <C-a> :Ack!<CR>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Airline
let g:airline_theme = 'deus'
let g:airline#extensions#tmuxline#enabled = 0

" TComment
nmap <leader>c :TComment<CR>
vmap <leader>c :TCommentBlock<CR>

" Bufkill
nmap <leader>D :BD<CR>

" Vim-Rooter
let g:rooter_silent_chdir = 1

" Alchemist
let g:alchemist_tag_disable = 1

" nmap <leader>B :Mcompile<CR>
" nmap <leader>T :Mtest<CR>

" TagBar
" nmap <C-m> :TagbarToggle<CR>

let g:tagbar_type_elixir = {
      \ 'ctagstype' : 'elixir',
      \ 'kinds' : [
      \ 'f:functions',
      \ 'functions:functions',
      \ 'c:callbacks',
      \ 'd:delegates',
      \ 'e:exceptions',
      \ 'i:implementations',
      \ 'a:macros',
      \ 'o:operators',
      \ 'm:modules',
      \ 'p:protocols',
      \ 'r:records',
      \ 't:tests'
      \ ]
      \ }
