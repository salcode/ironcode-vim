call plug#begin()

" Sensible Vim Defaults
Plug 'tpope/vim-sensible'

" Solarized Color Scheme
Plug 'altercation/vim-colors-solarized'

" File explorer (enhanced netrw), trigger from Normal mode with `-`
Plug 'tpope/vim-vinegar'

" Status line
Plug 'bling/vim-airline'

" Comment toggling, trigger with `gcc`
Plug 'tpope/vim-commentary'

" Add support for .editorconfig file in a project
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" Configure Solarized Color Scheme
syntax enable
set background=light
colorscheme solarized

" Configure File Explorer to include line numbers
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" Configure Status line
	" display list of buffers by filename
	let g:airline#extensions#tabline#enabled = 1
	" ignore the path of the buffer (show only filename)
	let g:airline#extensions#tabline#fnamemod = ':t'

" Configure Comment toggling style to "//" instead of "/*" in PHP
augroup fe_commentary_php_commentstring
	autocmd!
	autocmd FileType php setlocal commentstring=//\ %s
augroup END

" show invisible characters
set list

" show line numbers
set number

" set font and font size for GUI
set guifont=Monaco:h13

" highlight column 80 if supported
if (exists('+colorcolumn'))
	set colorcolumn=80
	highlight ColorColumn ctermbg=9
endif

" Make undo persistant (across buffer changes or file close and open)
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" shortcuts for window navigation Ctrl+h (left), Ctrl+j (down), etc.
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
