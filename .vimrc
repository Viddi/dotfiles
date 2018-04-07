call plug#begin('~/.vim/plugged')

Plug 'ervandew/supertab' " Tab for autocompletion while in insert mode
Plug 'scrooloose/nerdtree' " Show project structure
Plug 'jiangmiao/auto-pairs' " Automatically open/close pairs
Plug 'tomtom/tcomment_vim' " Better support for commenting code
Plug 'vim-scripts/bufkill.vim' " Delete buffer without closing the window
Plug 'flazz/vim-colorschemes' " More colors
Plug 'airblade/vim-rooter' " Automatically changes working directory to project root
Plug 'airblade/vim-gitgutter' " Show git diff signs
Plug 'kien/rainbow_parentheses.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'romgrk/winteract.vim' " Window management

" Airline
Plug 'vim-airline/vim-airline' " Status bar at the bottom
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline' " Display open buffers on the status bar
Plug 'edkolev/tmuxline.vim'

" Tags
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

" Erlang
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-tags'

" Elixir
Plug 'elixir-lang/vim-elixir' " Vim configuration files for Elixir
Plug 'slashmili/alchemist.vim' " Elixir integration
Plug 'mattreduce/vim-mix'
Plug 'tpope/vim-endwise'

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

colorscheme solarized

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

" CtrlP
" let g:ctrlp_map = '<leader>t'
" let g:ctrlp_show_hidden = 1
" let g:ctrlp_max_files = 0
" let g:ctrlp_custom_ignore = '/doc\|/_build\|build\|DS_Store\|git' " TODO: Set up custom environment ignore

" Search and jump to tags
" nmap <leader>f <esc>:CtrlPTag<CR>

" Winteract
nmap <leader>w :InteractiveWindow<CR>

" fzf
nmap <leader>b :Buffers<CR>
nmap <leader>t :Files<CR>
nmap <leader>f :Tags<CR>

" Ack
cnoreabbrev Ack Ack!
nnoremap <leader>a :Ack!<Space>
nmap <C-i> :Ack! "\b<cword>\b" <CR>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Airline
let g:airline_solarized_bg='dark'
let g:airline_theme = 'solarized'
let g:airline#extensions#tmuxline#enabled = 0

" TComment
nmap <leader>c :TComment<CR>
vmap <leader>c :TCommentBlock<CR>

" Bufkill
nmap <leader>D :BD<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1

" Vim-Rooter
let g:rooter_silent_chdir = 1

" Alchemist
let g:alchemist_tag_disable = 1

nmap <leader>B :Mcompile<CR>
nmap <leader>T :Mtest<CR>

" Elixir nvim
" let g:elixir_showerror = 1
" let g:elixir_autobuild = 1

" TagBar
nmap <C-j> :TagbarToggle<CR>

" Rainbow Parentheses always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

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
