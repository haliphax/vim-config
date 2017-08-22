" load our bundles
call pathogen#infect()
call pathogen#helptags()

"--- settings ---

set enc=utf-8           " default encoding
set history=100         " # of commands to remember
set incsearch           " incremental search
set laststatus=2        " keep status bar even for 1 window
set hlsearch            " highlight search results
set pastetoggle=<F2>    " F2 to toggle PASTE mode
set ruler               " show cursor position, etc.
set scrolloff=3         " vertical scroll margin
set siso=10             " horizontal scroll margin
set shiftwidth=4        " use 4 spaces for tabs
set tabstop=4           " ^
set number              " show numbers
set relativenumber      " relative numbers mode
set nuw=5               " width of numbers column
set ignorecase          " ignore case when searching
set smartcase           " ^ unless uppercase is present in search string
set lazyredraw          " don't redraw while executing macros
set magic               " for regex searching
set mouse=a             " use the mouse everywhere
set nobackup            " don't keep a backup of files
set noswf               " no swap file
set nowrap              " don't wrap lines
set cindent             " smart indent
set cinkeys-=0#         " don't remove indent with # nor 0
set indentkeys-=0#
set fdm=indent          " fold by indent
set foldlevelstart=20   " fold all by default
set t_Co=256            " 256 colors
set bg=dark             " dark background
set omnifunc=syntaxcomplete#Complete    " omni complete
set backspace=indent,eol,start          " backspace fix
set cursorline          " highlight current line
set cursorcolumn        " highlight current column
set colorcolumn=80      " column marker at 80th column

" set leader to ,
let mapleader=","

"--- key mappings ---

" move between windows easily
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
" edit .vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
" source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" wrap in double quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" wrap in single quotes
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" folding
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
" arrow keys
nnoremap <Esc>A <up>
nnoremap <Esc>B <down>
nnoremap <Esc>C <right>
nnoremap <Esc>D <left>
" hide search highlight
nnoremap <esc> :noh<cr><esc>
" add semicolon to end of line
nnoremap <leader>; mqA;<esc>`q
" grep for word under cursor
nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
" toggle nerdtree drawer
nnoremap <leader>d :NERDTreeToggle<cr>
" recent files
nnoremap <leader>o :MRU<cr>
" tag bar
nnoremap <leader>T :TagbarToggle<cr>
" command-t
nnoremap <leader>t :CommandT<cr>
" zap trailing whitespace
nnoremap <leader>$ mq:silent %s/\s\+$//g<cr>:silent noh<cr>:echom 'Trailing whitespace zapped'<cr>`q
" spaces -> tabs
nnoremap <leader><space> :set et<cr>:retab!<cr>:echom 'Tabs -> spaces'<cr>
" tabs -> spaces
nnoremap <leader><tab> :set noet<cr>:retab!<cr>:echom 'Spaces -> tabs'<cr>
" fugitive
" - status
nnoremap <leader>gs :Gstatus<cr>
" - commit
nnoremap <leader>gc :Gcommit<cr>
" - pull
nnoremap <leader>gp :Git pull<cr>
" - push
nnoremap <leader>gP :Git push<cr>
" move between tabs with tab/shift-tab
nnoremap <tab> :tabnext<cr>
nnoremap <s-tab> :tabp<cr>
" angle brackets shift blocks back and forth in visual mode
vnoremap > :><cr>gv
vnoremap < :<<cr>gv
" close all but this buffer
nnoremap <leader>C :NERDTreeClose<cr>:%bd<cr>:e#<cr>
" limelight
nnoremap gl :Limelight!!0.8<cr>
xnoremap gl :Limelight!!0.8<cr>
" change working dir of window to current file
nnoremap <leader>cd :lcd %:p:h<cr>
" commentary
vnoremap \\ :Commentary<cr>
nnoremap \\ :Commentary<cr>

" vp won't replace paste buffer
function! RestoreRegister()
    let @" = s:restore_reg
    return ''
endfunction
function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

"--- autocommands ---

aug hx
    au!
    " highlighting of last column
    au BufReadPost * highlight ColorColumn ctermbg=darkred
    " highlighting of row and column
    au BufReadPost * highlight CursorColumn ctermbg=8
    au BufReadPost * highlight CursorLine ctermbg=8
    " remember where we left off in a file
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif
    " use xmllint as indent command while editing xml buffers
    au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
    " JSHint keymapping for JS files
    au FileType javascript nnoremap <buffer> <leader>l :JSHint<cr>
    " php -l keymapping for PHP files
    au FileType php setlocal makeprg=php\ -l\ %
    au FileType php nnoremap <buffer> <leader>l :execute("make!")<cr>:copen<cr>
    " pylint mapping for python files
    au FileType python set makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\U"\ %
    au FileType python set errorformat=%f:%l:\ %m
    au Filetype python nnoremap <buffer> <leader>l :execute("make!")<cr>:copen<cr>
aug END

"--- options ---

" enchanted vim
let g:VeryMagicSubstitute = 1
let g:VeryMagicGlobal = 1
" pylint
let g:pylint_onwrite = 0
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" autopep8
let g:autopep8_max_line_length=79
" supertab
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
" NERDTree
let g:NERDTreeMouseMode=3
let g:NERDTreeIgnore=['.pyc$[[file]]']
" airline-tagbar
let g:airline#extensions#tagbar#enabled = 1
" neocomplete
let g:neocomplete#enable_at_startup = 1

"--- extras ---

" syntax highlighting
syntax enable

" allow specific types of plugins to be loaded
filetype plugin on
filetype indent on

" colors
colors ir_black
" gitgutter
hi SignColumn ctermbg=black
" hi GitGutterAdd ctermbg=black ctermfg=green
" hi GitGutterChange ctermbg=black ctermfg=yellow
" hi GitGutterDelete ctermbg=black ctermfg=red
" hi GitGutterLineRemovedFirstLine ctermbg=black ctermfg=red
" hi GitGutterLineModifiedRemoved ctermbg=black ctermfg=yellow

:noh
