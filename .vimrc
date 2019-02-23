call plug#begin('~/.vim/plugged')
"# Javascript
  "Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'Quramy/vim-js-pretty-template'
  Plug 'pangloss/vim-javascript'
  Plug 'vim-syntastic/syntastic'
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  "Git wrapper
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdtree'
  "plugin for TypeScript
  Plug 'Quramy/tsuquyomi'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'morhetz/gruvbox'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'Valloric/YouCompleteMe'
  Plug 'elzr/vim-json'
call plug#end()

"Common config
set nospell
set number
set numberwidth=2
syntax on
set ruler
"Set edited buffers that aren't visible in a window somewhere
set hidden
"Hightlight matching brackets
set showmatch
"Show tabs
set list lcs=tab:>-,space:⋅
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

"elzr/vim-json – Concealing of double quotes, for a minimalist CoffeeScript-inspired look
let g:vim_json_syntax_conceal = 0

"Quramy/vim-js-pretty-template'
call jspretmpl#register_tag('gql', 'typescript')
autocmd FileType typescript syn clear foldBraces
autocmd FileType javascript JsPreTmpl html
autocmd FileType typescript JsPreTmpl typescript

"pangloss/vim-javascript
let g:javascript_plugin_ngdoc=1

"Enable OMNI compition
"filetype plugin on
"set omnifunc=syntaxcomplete#Complete


"Syntastic
"Available linters 'lynt'
let g:syntastic_typescript_checkers = ['tslint']
"Available linters 'eslint', 'jshint', 'gjslinter'
let g:syntastic_javascript_checkers = ['jslint']
let g:syntastic_json_checkers = ['json']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"tsuquyomi
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

"Disable folding for markdown
let g:vim_markdown_folding_disabled = 1

"Preview hunk in Gitgutter
"nmap <Leader>hv <Plug>GitGutterPreviewHunk
"Show partial diff
map <silent><C-o> :GitGutterPreviewHunk <CR>
"Undo and hide partial diff
map <silent><C-x> :GitGutterUndoHunk <bar> :pclose <CR>

"Auto remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

"Sets the working directory to the current file's directory
"autocmd BufEnter * lcd %:p:h

"typescript-vim config
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"vim-js-pretty-template
autocmd FileType javascript JsPreTmpl
autocmd FileType javascript.jsx JsPreTmpl
autocmd FileType typescript JsPreTmpl
autocmd FileType typescript syn clear foldBraces " For leafgarland/typescript-vim users only.

"Nerdtree config
autocmd vimenter * NERDTree
"Close Nerdtree is no file is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Visual fixes
let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"Start NERDTree
autocmd VimEnter * NERDTree
"Go to previous (last accessed) window.
"autocmd VimEnter * wincmd p
"Hotkey to focus NERDTree
map <silent> <C-LEFT> :NERDTreeFocus<CR>
map <silent> <C-RIGHT> :wincmd w<CR>

"Moving lines up and down
map <silent> <C-j> :m-2<CR>
map <silent> <C-k> :m+<CR>
"map <silent> <S-Up> <Esc>:m-2<CR>
"map <silent> <S-Down> <Esc>:m+<CR>

"nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "≅",
    \ "Staged"    : "⊆",
    \ "Untracked" : "⊄",
    \ "Renamed"   : "≠",
    \ "Unmerged"  : "∉",
    \ "Deleted"   : "∅",
    \ "Dirty"     : "⍝",
    \ "Clean"     : "≡",
    \ 'Ignored'   : 'º',
    \ "Unknown"   : "¿"
    \ }

"Theme config
let g:gruvbox_italic=0
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'medium'
set background=dark
let g:airline_theme = 'gruvbox'
"let g:gruvbox_termcolors=16

filetype plugin indent on


" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab


