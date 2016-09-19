"--- key mappings ---

" edit .vimrc
nnoremap <leader>egv :tabnew $MYGVIMRC<cr>
" source .vimrc
nnoremap <leader>sgv :source $MYGVIMRC<cr>
" CTRL-C copy
vmap <C-c> "+y<ESC>
" CTRL-X cut
vmap <C-x> "+c<ESC>
" CTRL-V paste
vmap <C-v> c<ESC>"+Pl
imap <C-v> <ESC>"+Pli
nmap <C-v> "+P<ESC>l

"--- options ---

set guioptions+=rb	" force scrollbars
set gfn=DejaVu\ Sans\ Mono\ 11
colors solarized
