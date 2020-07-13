" Use two spaces for indentation.
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal noexpandtab

" Treat `$` as part of the word
setlocal iskeyword+=$

" Include directory name in tabline for JS files named index.js
let g:airline#extensions#tabline#formatter = 'jsformatter'
