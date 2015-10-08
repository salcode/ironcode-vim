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
