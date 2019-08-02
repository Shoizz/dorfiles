call plug#begin('~/.local/share/nvim/plugged')
  Plug 'scrooloose/nerdTree'
  Plug 'bling/vim-airline'
  Plug 'cocopon/iceberg.vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-surround'
  Plug 'enricobacis/vim-airline-clock'

  "Use :Ggrep <...> to search for words and :cnext :cprevious to
  "navigate search results
  Plug 'tpope/vim-fugitive'

  "asynchronous execution library for Vim
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}

  "Serching files
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  Plug 'airblade/vim-gitgutter'
  Plug 'godlygeek/tabular'

  "Plug 'Quramy/tsuquyomi'
  Plug 'Valloric/YouCompleteMe'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'Quramy/vim-js-pretty-template'


  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'Yggdroot/indentLine'

  "Supported features are Go to Definition, Quick Info, Signature Help, Show
  "Compile Errors, Symbol Rename and Show References
  "Plug 'runoshun/tscompletejob'
call plug#end()

"""""""""""""
" Shortcuts "
"""""""""""""
nmap <C-n> :NERDTreeToggle<CR>

"runoshun/tscompletejob
nmap <C-d> :TsCompleteJobGotoDefinition <CR>
nmap <C-f> :TsCompleteJobQuickInfo <CR>

"Moving lines up and down
map <silent> <C-j> :m-2<CR>
map <silent> <C-k> :m+<CR>

"Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

"Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

""""""""""""""""
" Theme config "
""""""""""""""""
colorscheme iceberg

"""""""""""""""""
" Common config "
"""""""""""""""""
" More frequent updates for, e.g. signs.
set updatetime=300

set nospell
set number
set numberwidth=2
syntax on
set ruler
"Auto remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e
"Set edited buffers that aren't visible in a window somewhere
set hidden
"Hightlight matching brackets
set showmatch
"Show tabs
set list lcs=tab:––,space:·
autocmd BufWinLeave * call clearmatches()
set cursorline
autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg
autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg
"Enable mouse
set mouse=a
"Tab shift back
imap <S-tab> <C-d>
"Fxing backspace for mac
set backspace=2
" Change style of highlighting
hi clear SpellBad
hi SpellBad cterm=underline
filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

"""""""""""""""""""""""""""
" runoshun/tscompletejob' "
"""""""""""""""""""""""""""

""""""""""""""""""""""""""
" Valloric/YouCompleteMe "
""""""""""""""""""""""""""
set completeopt-=preview

"""""""""""""""""""""""""""""""""
" Quramy/vim-js-pretty-template "
"""""""""""""""""""""""""""""""""
call jspretmpl#register_tag('gql', 'typescript')
autocmd FileType javascript JsPreTmpl
autocmd FileType typescript syn clear foldBraces
autocmd FileType typescript JsPreTmpl
autocmd FileType typescript syn clear foldBraces " For leafgarland/typescript-vim users only

""""""""""""""""""""""""""""
" 'airblade/vim-gitgutter' "
""""""""""""""""""""""""""""
"Preview hunk in Gitgutter
"nmap <Leader>hv <Plug>GitGutterPreviewHunk
"Show partial diff
map <silent><C-o> :GitGutterPreviewHunk <CR>
"Undo and hide partial diff
map <silent><C-x> :GitGutterUndoHunk <bar> :pclose <CR>

"""""""""""""""""""""""""""""""""
" enricobacis/vim-airline-clock "
"""""""""""""""""""""""""""""""""
let g:airline#extensions#clock#format = '⎸ %H:%M'

""""""""""""""""""""""""""""""
" leafgarland/typescript-vim "
""""""""""""""""""""""""""""""
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"""""""""""""""""""""""
" Yggdroot/indentLine "
"""""""""""""""""""""""
"indentLine will overwrite 'conceal' color with grey by default. If you want
"to highlight conceal color with your colorscheme, disable by:
"let g:indentLine_setColors = 0
let g:indentLine_color_term = 105
let g:indentLine_char = '¦'
" Background (Vim, GVim)
"let g:indentLine_bgcolor_term = 202
"let g:indentLine_bgcolor_gui = '#FF5F00'

"""""""""""""""""""""""
" scrooloose/nerdTree "
"""""""""""""""""""""""
"Close·Nerdtree·is·no·file·is·open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endifi

