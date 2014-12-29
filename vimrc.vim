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

" Bufkill Plugin {{{
" https://github.com/mattdbridges/bufkill.vim
" -------------------------------------------------------------
" `:BD` deletes a buffer but allows the window/viewport to
" stay open
Bundle 'mattdbridges/bufkill.vim'

" map `<leader>bd` to `:BD`
nnoremap <leader>bd! :BD<CR>
" }}}

" EditorConfig Plugin {{{
" https://github.com/editorconfig/editorconfig-vim
" -------------------------------------------------------------
" Adds support for an .editorconfig file, which allows an
" editor configuration to be shared across a project even when
" users are using different editors. Read more about the
" [EditorConfig Project](https://github.com/editorconfig/editorconfig-vim)
Bundle 'editorconfig/editorconfig-vim'

" }}}

" Syntastic Plugin {{{
" https://github.com/scrooloose/syntastic
" -------------------------------------------------------------
" Marks incorrect syntax lines with `>>` in the left side of the
" editor (the gutter).  Installed for PHP syntax checking but
" supports other languages, as well.
Bundle 'scrooloose/syntastic'

" }}}

" Vim Airline Plugin {{{
" https://github.com/bling/vim-airline
" -------------------------------------------------------------
" Lightweight status line.
Bundle 'bling/vim-airline'

" display list of buffers by filename
let g:airline#extensions#tabline#enabled = 1
" ignore the path of the buffer (show only filename)
let g:airline#extensions#tabline#fnamemod = ':t'
" }}}

" Vim Fugitive Plugin {{{
" https://github.com/tpope/vim-fugitive
" -------------------------------------------------------------
" Run Git commands directly from vim and looks for tags file in
" /.git, which is import for ctags setup
Bundle 'tpope/vim-fugitive'

" }}}

" Vim Fugitive Plugin {{{
" https://github.com/tpope/vim-fugitive
" -------------------------------------------------------------
" Run Git commands directly from vim and looks for tags file in
" /.git, which is import for ctags setup
Bundle 'tpope/vim-fugitive'

" }}}

" Vim Sensible Plugin {{{
" https://github.com/tpope/vim-sensible
" -------------------------------------------------------------
" Sensible Default Vim Settings
Bundle 'tpope/vim-sensible'

" }}}

" Vim Vinegar Plugin {{{
" https://github.com/tpope/vim-vinegar
" -------------------------------------------------------------
" Enhancement to netrw, Vim's directory browser
" `-` in __normal__ mode, opens a directory browser in
" your current window, repeated `-` moves up the directory
" tree. Clicking <Enter> opens the currently highlighted file
Bundle 'tpope/vim-vinegar'

" add line numbers to netrw (and vinegar)
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" }}}

" Vim Commentary Plugin {{{
"  https://github.com/tpope/vim-commentary
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
"
" }}}

" Vim Commentary Plugin Modifications* {{{
" -------------------------------------------------------------
" Change PHP comment string to
"  - change PHP comment style to // (instead of default /* */)
augroup fe_commentary_php_commentstring
	autocmd!
	autocmd FileType php setlocal commentstring=//\ %s
augroup END

" }}}

" General Mappings {{{

	" Modify <leader> to comma {{{
	" -------------------------------------------------------------
	" map comma to leader
	" and backslash to comma (so we don't lose the comma functionality)
	" note: default comma functionality is to repeat
	" `f` or `t` find in reverse direction
	let mapleader = ","
	let g:mapleader = ","
	noremap \ ,
	" }}}

" }}}
