" Use tab characters (\t) for indentation and
" display each \t as 4 characters wide.
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal noexpandtab

" Treat `$` as part of the word
setlocal iskeyword+=$

" Map <leader>db to create PHP DocBlock.
nnoremap <buffer> <leader>db :call pdv#DocumentCurrentLine()<cr>
