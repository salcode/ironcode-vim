call plug#begin()

" Sensible Vim Defaults
Plug 'tpope/vim-sensible'

" Solarized Colorscheme
Plug 'altercation/vim-colors-solarized'

" Badwolf Colorscheme
Plug 'sjl/badwolf'

" Vim-Two-Firewatch Colorscheme
Plug 'rakr/vim-two-firewatch'

" File explorer (enhanced netrw), trigger from Normal mode with `-`
Plug 'tpope/vim-vinegar'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Comment toggling, trigger with `gcc`
Plug 'tpope/vim-commentary'

" Add support for .editorconfig file in a project
Plug 'editorconfig/editorconfig-vim'

" Add ability to close buffer and keep window, :BD
Plug 'qpkorr/vim-bufkill'

" Add undo tree exploration with :UndotreeToggle
Plug 'mbbill/undotree'

" Look for ctags file in .git directory
Plug 'tpope/vim-fugitive/'

" Add common mappings
Plug 'tpope/vim-unimpaired/'

" Add syntax checking
Plug 'scrooloose/syntastic'

" Vim / tmux sharing Ctrl-h/j/k/l for window / pane navigation
Plug 'christoomey/vim-tmux-navigator'

" Alignment Plugin, visually select and then use (`ga=`) to align on `=`
Plug 'junegunn/vim-easy-align'

" <leader>el on an variable creates an error log statement for it
Plug 'salcode/vim-error-log-shortcut'

call plug#end()

if has('termguicolors')
	set termguicolors
endif

syntax enable

" Perform syntax highlighting the first 256 columns only.
set synmaxcol=256

if has('gui_running')
	" Configure Solarized Color Scheme
	set background=light
	colorscheme solarized
endif

if has('nvim')
	colorscheme badwolf
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

" set leader to space key
let mapleader = "\<Space>"

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

" Close syntastic errors (i.e. location list) when buffer is deleted or a
" split is opened
cabbrev bd lclose<bar>bd
cabbrev BD lclose<bar>BD
cabbrev sp lclose<bar>sp
cabbrev vs lclose<bar>vs
cabbrev close lclose<bar>close

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

" map j to gj and k to gk, so line navigation ignores line wrap
" http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'

" Skip the netrw buffer when using Ctrl-^
let g:netrw_altfile = 1

" use clipboard as primary register for y,d,p
set clipboard=unnamed

" Add shortcut <leader>u for UndotreeToggle plugin
nnoremap <leader>u :UndotreeToggle<CR>

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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
