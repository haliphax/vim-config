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
vmap <C-v> <ESC>"+Pl
imap <C-v> <ESC>"+pli
nmap <C-v> "+P<ESC>l

"--- options ---

set guioptions +=bgkrt
set guioptions -=T

"--- windows vs. linux settings ---

if has('win32') || has('win64')
	"GitGutterDisable
	set gfn=DejaVu_Sans_Mono:h10:cANSI:qDRAFT
else
	set gfn=DejaVu\ Sans\ Mono\ 10
endif
