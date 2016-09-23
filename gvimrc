"--- key mappings ---

" edit .gvimrc
nnoremap <leader>egv :tabnew $MYGVIMRC<cr>
" source .gvimrc
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

"--- windows settings ---

if has('win32') || has('win64')
	GitGutterDisable
	set gfn=DejaVu_Sans_Mono:h11:cANSI:qDRAFT
endif
