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

" Add ability to close buffer and keep window, :BD
Plug 'qpkorr/vim-bufkill'

" Add undo tree exploration with :GundoToggle
Plug 'sjl/gundo.vim'

" Look for ctags file in .git directory
Plug 'tpope/vim-fugitive/'

" Add common mappings
Plug 'tpope/vim-unimpaired/'

" Add syntax checking
Plug 'scrooloose/syntastic'

call plug#end()

if has('gui_running')
	" Configure Solarized Color Scheme
	syntax enable
	set background=light
	colorscheme solarized
endif

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

" display tabs as taking up 4 spaces
set tabstop=4

" set << and >> to move 4 columns
set shiftwidth=4

" use the tab character (not spaces)
set noexpandtab

" if this number were less than tabstop, pressing tab in insert mode
" would insert a combination of the tab character and spaces
set softtabstop=4

" set font and font size for GUI
set guifont=Monaco:h13

" highlight all search matches after search is complete
set hlsearch

" ignore case when searching
set ignorecase

" override ignorecase if the search pattern contains upper case characters
set smartcase

" treat `-` and `$` as part of the word, not boundaries
set iskeyword+=-,$

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

" do all work in memory, no swap file
set noswapfile

" if a file is changed outside Vim, automatically re-read it
set autoread

" set leader to ,
let mapleader = ","

" Syntastic recommended default settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic disabled file types
let g:syntastic_mode_map = { 'passive_filetypes': ['scss'] }

" Syntastic settings for phpcs and WordPress coding standards
"
" Run base PHP checker first, then run phpcs with WordPress standard
" If phpcs does not exist or the standard does not exist,
" Syntastic skips them (failing gracefully)
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = '--standard=WordPress'

" If phpcs.xml is found, it supercedes the standard set above
let g:syntastic_php_phpcs_standard_file = "phpcs.xml"

" BufKill remove verbose messages
let g:BufKillVerbose = 0
" BufKill when a buffer is displayed in multiple windows 'kill'
"     rather than the default 'confirm'
let g:BufKillActionWhenBufferDisplayedInAnotherWindow = 'kill'

nnoremap <leader>cs :call CodeStandardsMenu()<cr>

function! CodeStandardsMenu()
	let l:myMakeTargets = ["abort", "Cancel", "WordPress", "PHP", "Laravel"]
	let l:c = 0
	let l:c = confirm("Code Standards ","&Cancel\n&WordPress\n&PHP\n&Laravel")

	if l:c == 2
		let g:syntastic_php_checkers = ['php', 'phpcs']
		let g:syntastic_php_phpcs_args = '--standard=WordPress'
	endif

	if l:c == 3
		let g:syntastic_php_checkers = ['php']
	endif

	if l:c == 4
		let g:syntastic_php_checkers = ['php', 'phpcs']
		let g:syntastic_php_phpcs_args = '--standard=PSR2'
	endif

	echo g:syntastic_php_checkers
	echo g:syntastic_php_phpcs_args

endfunction

" shortcuts for window navigation Ctrl+h (left), Ctrl+j (down), etc.
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" map j to gj and k to gk, so line navigation ignores line wrap
" http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'

" use clipboard as primary register for y,d,p
set clipboard=unnamed

" Add shortcut <leader>u for Gundo plugin
nnoremap <leader>u :GundoToggle<CR>

" easy access to register containing last yank (ignoring delete and replace)
nnoremap <leader>p "0p


" Map `<leader>ts2` to set expand (t)abs to (s)paces with (2) characters indicating a tab
nnoremap <leader>ts2 :set tabstop=2 softtabstop=2 shiftwidth=2 expandtab<CR>

" Map `<leader>ts4` to set expand (t)abs to (s)paces with (4) characters indicating a tab
nnoremap <leader>ts4 :set tabstop=4 softtabstop=4 shiftwidth=4 expandtab<CR>

" Map `<leader>tt2` to set (t)abs to be treated as (t)ab characters and display as (2) characters
nnoremap <leader>tt2 :set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab<CR>

" Map `<leader>tt4` to set (t)abs to be treated as (t)ab characters and display as (4) characters
nnoremap <leader>tt4 :set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab<CR>
