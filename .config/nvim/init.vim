" ========================================================================
"                                 Plugins
" ========================================================================
call plug#begin('~/.local/share/nvim/plugged')

" Language Server Protocol
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'sheerun/vim-polyglot'

Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" Fuzzy search files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Window management
Plug 'romgrk/winteract.vim'

" Status bar
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'ap/vim-buftabline'
Plug 'edkolev/tmuxline.vim'

" Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" ========================================================================
"                             Basic Configuration
" ========================================================================
set encoding=utf-8
set hidden " Allow editing multiple buffers without saving
set relativenumber " Show relative line numbers
set number " Display cursor line number
set expandtab " Convert tabs to spaces
set smartindent
set smarttab " Convert tabs at the beginning of a line to spaces
set shiftwidth=2 " Default tabs to 2 spaces
set softtabstop=2
set ignorecase " Case insensitive search
set smartcase " If pattern has uppercase then case sensitive
set nobackup
set nowritebackup
set cmdheight=1 " Better display for messages
set updatetime=300 " Smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c " Decrease message size
set signcolumn=no " Always show signcolumns
set noshowmode " Don't show modes since it's displayed in Lightline

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

map <C-q> <esc>:q<CR>
imap <C-q> <esc>:q<CR>

" Cycle through buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" Execute macro in q buffer
map Q @q

" Save on focus loss
au FocusLost * silent! wa
set autowriteall

" ========================================================================
"                             Themes & colors
" ========================================================================
if $TERM == "rxvt-unicode-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

syntax enable
set background=dark
colorscheme dracula

" Gray 239 - Cyan 117 - Green 84 - Purple 141
" Remove background to keep transparency
hi Normal guibg=NONE ctermbg=NONE
hi BufTabLineFill ctermbg=239
hi BufTabLineCurrent ctermfg=84
hi BufTabLineHidden ctermfg=117 ctermbg=239

" ========================================================================
"                           Plugin Configuration
" ========================================================================

" Ranger
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
let g:ranger_map_keys = 0

" Winteract
nmap <leader>w :InteractiveWindow<CR>

" fzf
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
nmap <leader>t :Files<CR>
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_nvim_statusline = 0 " Disable statusline overwriting

" Lightline
let g:lightline = {
\  'colorscheme': 'dracula',
\  'active': {
\    'left': [
\      ['mode', 'paste'],
\      ['gitbranch', 'cocstatus', 'readonly', 'filename']
\    ]
\  },
\  'component_function': {
\    'gitbranch': 'gitbranch#name',
\    'readonly': 'LightlineReadonly',
\    'filename': 'LightlineFilename',
\    'cocstatus': 'coc#status'
\  }
\}

" Hide readonly label in help buffers
function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

" Remove the bar between filename and modified sign
function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

" tmuxline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = 'full'

" Wintabs
let g:wintabs_ui_sep_rightmost = ''

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
