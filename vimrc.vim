" Vundle Setup {{{
" -------------------------------------------------------------

" Required by Vundle
set nocompatible              " be iMproved, required
filetype off        " required by Vundle, re-enabled below

" set runtime path
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" let Vundle manage vundle
Plugin 'gmarik/vundle'

" }}}

" Vim Sensible Plugin {{{
" -------------------------------------------------------------
" Sensible Default Vim Settings
" https://github.com/tpope/vim-sensible
Bundle 'tpope/vim-sensible'

" }}}

" Vim Commentary Plugin {{{
" -------------------------------------------------------------
" `gcc` will toggle comment the current line in __normal__ mode
" `gc` will toggle comment the current selection in __visual__ mode
"
"  note: after vundle block, the following modifications are included*:
"  - change PHP comment style to // (instead of default /* */)
Bundle 'tpope/vim-commentary'
"  }}}

" Vundle Setup Complete {{{
" -------------------------------------------------------------
call vundle#end()            " required
filetype plugin indent on    " required
"  }}}

" * why do autocmd FileType settings appear after vundle block?{{{
" -------------------------------------------------------------
" Vundle requires filetype plugin off at the beginning :
" }}}

" Vim Commentary Plugin Modifications* {{{
" -------------------------------------------------------------
 Change PHP comment string to
"  - change PHP comment style to // (instead of default /* */)
augroup fe_commentary_php_commentstring
	autocmd!
	autocmd FileType php setlocal commentstring=//\ %s
augroup END
" }}}
