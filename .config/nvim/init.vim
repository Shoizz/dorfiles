call plug#begin('~/.local/share/nvim/plugged')
  Plug 'scrooloose/nerdTree'
  Plug 'bling/vim-airline'
  Plug 'cocopon/iceberg.vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-surround'
  Plug 'enricobacis/vim-airline-clock'

  "Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  "asynchronous execution library for Vim
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}

  "Serching files
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  Plug 'godlygeek/tabular'

  "Plug 'Quramy/tsuquyomi'
  Plug 'Valloric/YouCompleteMe'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'Quramy/vim-js-pretty-template'

  "Color highlight in CSS
  Plug 'chrisbra/Colorizer'

  Plug 'Yggdroot/indentLine'

call plug#end()

"""""""""
" Hints "
"""""""""
" 1. Search and replace
  " – To serch and replace use :%s/wordtosearch/wordtoreplace/gc
  " – To search and replace multiple occurrences use :%s/Kang\\|Kodos/alien/gc

" 2. Search symbol occurrence
  " Use :Ggrep <...> to search for words and :cnext :cprevious to navigate search results

"""""""""""""
" Shortcuts "
"""""""""""""
" Tab shift back
imap <S-tab> <C-d>

" Toggle NerdTree
nmap <C-n> :NERDTreeToggle<CR>

" Toggle mouse
nmap <C-a> :call FoldColumnToggle()<cr>

" runoshun/tscompletejob
nmap <C-d> :YcmCompleter GoToDefinition <CR>
nmap <C-f> :YcmCompleter GoToReferences <CR>

" Moving lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
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
" More frequent updates for, e.g. signs. If not updating - set manually to
" lower value e.g. :set updatetime = N-100
set updatetime=300

set nospell
set number
set numberwidth=2
syntax on
set ruler

" Auto remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Set edited buffers that aren't visible in a window somewhere
set hidden

" Hightlight matching brackets
set showmatch

" Show tabs
set list lcs=tab:––,space:·

autocmd BufWinLeave * call clearmatches()
set cursorline
autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg
autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg

" Toggle mouse
let g:togglemouse=1
set mouse=""

function! FoldColumnToggle()
    if g:togglemouse
        set mouse=""
        let g:togglemouse=0
        echo "Mouse disabled"
    else
        set mouse=a
        let g:togglemouse=1
        echo "Mouse enabled"
    endif
endfunction

" Fxing backspace for mac
set backspace=2

" Change style of highlighting
hi clear SpellBad
hi SpellBad cterm=underline

filetype plugin indent on

" On pressing tab, insert 2 spaces
set expandtab

" Show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2

" When indenting with '>', use 2 spaces width
set shiftwidth=2

""""""""""""""""""""""""""
" Valloric/YouCompleteMe "
""""""""""""""""""""""""""
" Disable doc preview
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

" Update git signs on save
autocmd BufWritePost * GitGutter

"""""""""""""""""""""""""""""""""
" enricobacis/vim-airline-clock "
"""""""""""""""""""""""""""""""""
let g:airline#extensions#clock#format = '┆ %H:%M'

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

