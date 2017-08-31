call plug#begin('~/.local/share/nvmim/plugged')

Plug 'DonnieWest/VimStudio'
Plug 'scrooloose/nerdtree' " Show project structure
Plug 'jiangmiao/auto-pairs' " Automatically open/close pairs
Plug 'kien/ctrlp.vim' " Look up files in the current tree
Plug 'tomtom/tcomment_vim' " Better support for commenting code
Plug 'vim-scripts/bufkill.vim' " Delete buffer without closing the window
Plug 'flazz/vim-colorschemes' " More colors

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Keyword completion

Plug 'artur-shaik/vim-javacomplete2'

" Elixir
Plug 'elixir-lang/vim-elixir' " Vim configuration files for Elixir
Plug 'slashmili/alchemist.vim' " Elixir integration

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

" ========================================================================
"                           Themes & colors
" ========================================================================

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

syntax enable
set background=dark

if has('gui_running')
  colorscheme solarized
else
  colorscheme solarized
endif

" ========================================================================
"                             Environments
" ========================================================================

" if exists('android')
"   echo "Starting up Android environment"
"
"   Plug 'DonnieWest/VimStudio'
" endif
"
" if exists('elixir')
"   echo "Starting up Elixir environment"
" endif


" ========================================================================
"                          Plugin Configuration
" ========================================================================

" NERDTree
map <C-t> :NERDTreeToggle<CR>

" Close vim if NERDTree is ithe only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" CtrlP
let g:ctrlp_map = '<leader>t'
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = '/build\|DS_Store\|git'

" TComment
nmap <leader>c :TComment<CR>
vmap <leader>c :TCommentBlock<CR>

" Bufkill
nmap <leader>D :BD<CR>

" Deoplete
" let g:deoplete#enable_at_startup = 1

" JavaAutocomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
