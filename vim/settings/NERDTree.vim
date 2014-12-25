" Make NERDTree look pretty
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 30

" Key mapping for NERDTree
map <leader>nt :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>

" Close vim if NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
