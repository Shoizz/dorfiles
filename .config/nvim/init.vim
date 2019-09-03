"
"\/|\\\
"
" File: init.vim
" Maintainer: shoizz <https://github.com/Shoizz>

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'scrooloose/nerdTree'
  Plug 'bling/vim-airline'
  Plug 'cocopon/iceberg.vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-surround'
  Plug 'enricobacis/vim-airline-clock'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " asynchronous execution library for Vim
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}

  " Serching files
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  Plug 'godlygeek/tabular'

  Plug 'Valloric/YouCompleteMe'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'Quramy/vim-js-pretty-template'

  Plug 'ntpeters/vim-better-whitespace'

  " Color highlight in CSS
  Plug 'chrisbra/Colorizer'

  " Highlight open and closed html tags
  Plug 'Valloric/MatchTagAlways'

  " Line indentation
  Plug 'nathanaelkane/vim-indent-guides'
  "Plug 'Yggdroot/indentLine'

call plug#end()

"""""""""
" Hints "
"""""""""
" 1. Search and replace
"   a. To serch and replace use :%s/wordtosearch/wordtoreplace/gc
"   b. To search and replace multiple occurrences use :%s/Kang\\|Kodos/alien/gc

" 2. Search symbol occurrence
"   Use :Ggrep <...> to search for words and :cnext :cprevious to navigate search results

" 3. Two solutions for updating nerdTree when file are deleted:
"   a. Use nerdtree to delete the dir - i.e. go to the node and hit md
"   b. Delete the dir with !rm ... and then hit R in the nerdtree to refresh the tree

" 4. Quit all buffers
"   a. Save and quit :wqa
"   b. Just quit :qa

" 5. Reload
"   a. Windows :windo e
"   b. Buffers :bufdo e

" 6. Renaming file
"   :Gwrite to add file to repo, :Gmove filepath/newfilename

" 7. Copy from one register to enother
"   "+yy "+p

" 8. Deleting word
"   dw

"""""""""""""
" Shortcuts "
"""""""""""""
"Shift back
"<C-d>

" Toggle NerdTree
nmap <C-n> :NERDTreeToggle<CR>

" Toggle mouse
" nmap <C-a> :call MouseToggle()<cr>

" Reload window
nmap <C-a> :windo e<CR>

" runoshun/tscompletejob
nmap <C-d> :YcmCompleter GoToDefinition <CR>
nmap <C-f> :YcmCompleter GoToReferences <CR>

" airblade/vim-gitgutter
" Show partial diff
map <silent><C-o> :GitGutterPreviewHunk <CR>
" Undo and hide partial diff
map <silent><C-x> :GitGutterUndoHunk <bar> :pclose <CR>
map <silent><C-t> :GitGutterPrevHunk <CR>
map <silent><C-y> :GitGutterNextHunk <CR>

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

" Auto closing html tags
" noremap <C-q> </<C-X><C-O>

""""""""""""""""
" Theme config "
""""""""""""""""
colorscheme iceberg

"""""""""""""""""
" Common config "
"""""""""""""""""
set lazyredraw

set wrap linebreak nolist
set breakindent

" More frequent updates for, e.g. signs. If not updating - set manually to
" lower value e.g. :set updatetime = N-100
set updatetime=300

set nospell
set number
set numberwidth=2
syntax on
set ruler

" Auto intending
filetype indent on
set filetype=html
set smartindent

" Auto remove trailing whitespaces
"autocmd BufWritePre * :%s/\s\+$//e

" Autoclosing brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Set edited buffers that aren't visible in a window somewhere
set hidden

" Hightlight matching brackets
set showmatch

" Show tabs
set list lcs=tab:––,space:·

autocmd BufWinLeave * call clearmatches()

" Enable cursor
set cursorline

" Toggle mouse
"let g:togglemouse=1
"set mouse=""
"function! MouseToggle()
"    if g:togglemouse
"        set mouse=""
"        let g:togglemouse=0
"        echo "Mouse disabled"
"    else
"        set mouse=a
"        let g:togglemouse=1
"        echo "Mouse enabled"
"    endif
"endfunction

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

let g:mta_use_matchparen_group = 0
let g:mta_set_default_matchtag_color = 0


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
" Preview hunk in Gitgutter
"nmap <Leader>hv <Plug>GitGutterPreviewHunk

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
"let g:indentLine_color_term = 8
"let g:indentLine_char = '⋮'
" Background (Vim, GVim)
"let g:indentLine_bgcolor_term = 202
"let g:indentLine_bgcolor_gui = '#FF5F00'

"""""""""""""""""""""""""""""""""""
" nathanaelkane/vim-indent-guides "
"""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0 ctermfg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermfg=8

"""""""""""""""""""""""
" scrooloose/nerdTree "
"""""""""""""""""""""""
"Close·Nerdtree·is·no·file·is·open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endifi

""""""""""""""""""""""""""""""""""
" ntpeters/vim-better-whitespace "
""""""""""""""""""""""""""""""""""
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

""""""""""""""""
" junegunn/fzf "
""""""""""""""""
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=7 ctermbg=0
  highlight fzf2 ctermfg=7 ctermbg=0
  highlight fzf3 ctermfg=7 ctermbg=0
  setlocal statusline=%#fzf1#\ ⌘\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()
"Enable search for hidden files
let $FZF_DEFAULT_COMMAND='find . -printf "%P\\n"'

""""""""""""""""""
" bling/air-line "
""""""""""""""""""
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_symbols.crypt = 'C'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ' LN'

