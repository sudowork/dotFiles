nnoremap <leader>af :Ag 

" For JavaScript files, provide a way to search for <base_filename>-test
autocmd FileType javascript nnoremap <leader>at :AgFile! %:t:r-test<CR>
