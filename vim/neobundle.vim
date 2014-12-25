" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

let bundlespath='~/.vim/bundles'

if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  exe 'set runtimepath+=' . bundlespath
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Install all bundles defined in ~/.vim/bundles/*.bundle
for fpath in split(globpath(bundlespath, '*.bundle'), '\n')
  exe 'runtime' eval("fnamemodify('" . fpath . "', ':t')")
endfor

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck
