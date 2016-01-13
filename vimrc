" ========================================================================
"                       Vundle Configuration
" ========================================================================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'marijnh/tern_for_vim' " Additional autocompletion for YouCompleteMe 
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/SearchComplete' " Tab-complete for searching words in vim search
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/bufkill.vim' " Delete buffer without closing the window
Plugin 'tpope/vim-unimpaired' " yo before you paste from clipboard
Plugin 'Lokaltog/vim-easymotion'
Plugin 'flazz/vim-colorschemes'
Plugin 'edkolev/tmuxline.vim'

Plugin 'Valloric/YouCompleteMe'
" YouCompleteMe compilation process:
" $ cd ~
" $ mkdir ycm_build
" $ cd ycm_build
" $ cmake -G "Unix Makefiles" -DEXTERNAL_LIBCLANG_PATH=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
" $ make ycm_support_libs

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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

" CtrlP
let g:ctrlp_map = '<leader>t'

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
