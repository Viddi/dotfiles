" ################ Vundle Configuration ################ "

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'marijnh/tern_for_vim' " Additional autocompletion for YouCompleteMe 
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround' " Hotkeys to surround selected text with any tags 
Plugin 'kien/rainbow_parentheses.vim' " Adds matching colors to parenthesis so it's easier to understand 
Plugin 'vim-scripts/SearchComplete' " Tab-complete for searching words in vim search
Plugin 'tmhedberg/matchit' " An extetion to jumping with '%'
Plugin 'ap/vim-buftabline'

" For some reason this isn't working with rainbow_parentheses
" Plugin 'pangloss/vim-javascript' " Javascript formatter

Bundle 'flazz/vim-colorschemes'
Bundle 'rizzatti/dash.vim'
Bundle 'matze/vim-move'

" YouCompleteMe compilation process:
" $ cd ~
" $ mkdir ycm_build
" $ cd ycm_build
" $ cmake -G "Unix Makefiles" -DEXTERNAL_LIBCLANG_PATH=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
" $ make ycm_support_libs
Bundle 'Valloric/YouCompleteMe'

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

" ################ End Configuration ################ "

" Color Schemes Configuration
syntax enable
set background=dark
if has('gui_running')
  colorscheme solarized
else
  colorscheme Tomorrow-Night-Eighties
endif

" Vim configuration
set encoding=utf-8
set relativenumber
set number        " line numbers
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent " always set autoindenting on
set hidden " set buffers to hidden - keep history

" Vim custom keymap
let mapleader = ","

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>

" NERDTree config
map <C-n> :NERDTreeToggle<CR> " Hotkey C-n to toggle NERDTree

" CtrlP Mapping
let g:ctrlp_map = '<leader>t'

" Automatically close scratch preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" YouCompleteMe fallback config
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Rainbow Parentheses always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Vim-move mapped to ctrl
let g:move_key_modifier = 'C'

" vim-buftabline keymap
nnoremap <D-]> :bnext<CR>
nnoremap <D-[> :bprev<CR>
