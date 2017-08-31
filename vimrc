" ========================================================================
"                            Package Manager
" ========================================================================

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'ervandew/supertab' " Tab for autocompletion while in insert mode
Plug 'scrooloose/nerdtree' " Show project structure
Plug 'marijnh/tern_for_vim' " Additional autocompletion for YouCompleteMe
Plug 'jiangmiao/auto-pairs' " Automatically open/close pairs
Plug 'kien/ctrlp.vim' " Look up files in the current tree
Plug 'kien/rainbow_parentheses.vim' " Color the parenthesis so it's easier to see
Plug 'vim-scripts/SearchComplete' " Tab-complete for searching words in vim search
Plug 'tomtom/tcomment_vim' " Better support for commenting code
Plug 'vim-airline/vim-airline' " Nice status bar
Plug 'vim-airline/vim-airline-themes' " Themes for the status bar
Plug 'vim-scripts/bufkill.vim' " Delete buffer without closing the window
Plug 'tpope/vim-unimpaired' " yo before you paste from clipboard
Plug 'Lokaltog/vim-easymotion' " Easier way to move around in a file
Plug 'flazz/vim-colorschemes' " More colors
Plug 'edkolev/tmuxline.vim' " Tmux info into the status line
Plug 'rizzatti/dash.vim' " Support to launch Dash.app from vim
Plug 'udalov/kotlin-vim' " Kotlin support
Plug 'Valloric/YouCompleteMe' " Autocompletion
Plug 'artur-shaik/vim-javacomplete2'

call plug#end()

" ========================================================================
"                             Environments
" ========================================================================
if exists('android')
  echo "Starting up Android environment"

  " Plug 'hsanson/vim-android'
  Plug 'DonnieWest/VimStudio'

  if has('unix')
    if has('mac') " Mac OSX
      " let g:android_sdk_pat = "/Users/ottov001/Library/Android/sdk/"
      autocmd FileType java setlocal omnifunc=javacomplete#Complete
    else " Anything not Mac is linux, because who uses windows?
      " TODO: Finish Linux setup
      " let g:android_sdk_pat = 
    endif
  endif
endif

if exists('elixir')
  echo "Starting up Elixir environment"

  Plug 'elixir-lang/vim-elixir' " Vim configuration files for Elixir
  Plug 'slashmili/alchemist.vim' " Elixir integration
endif

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
"                             Vim Stuff
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
set hidden " set buffers to hidden - keep history
set splitright " open split on right 
set splitbelow " open split below
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
set incsearch " Highlight search
set ignorecase
set smartcase
set hlsearch

autocmd BufEnter * silent! lcd %:p:h " Set working directory to file being opened

let mapleader = ","

map <leader>q :noh<CR>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" Cycle through buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" Execute macro in q
map Q @q

" Automatically close scratch preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

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

" YouCompleteMe fallback
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Rainbow Parentheses always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" TComment
nmap <leader>c :TComment<CR>
vmap <leader>c :TCommentBlock<CR>

" vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Easymotion
map <Leader> <Plug>(easymotion-prefix)

" Bufkill
nmap <leader>D :BD<CR>
"
" Kill and pane
nmap <leader>d :bd<CR>

" Dash
map <C-d> :Dash<CR>

" Alchemist
let g:alchemist_tag_stack_map = '<S-T>'
let g:alchemist_tag_map = '<S-U>'
