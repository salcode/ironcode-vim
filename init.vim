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

" Add WordPress dictionary and syntax to PHP files
Plug 'salcode/vim-wordpress-dict'

" Add common mappings
Plug 'tpope/vim-unimpaired/'

" Automatically record session on exit
Plug 'tpope/vim-obsession/'

" Add syntax checking
Plug 'w0rp/ale'

" xdebug support
Plug 'joonty/vdebug'

" Add PHP docblock generator.
Plug 'tobyS/pdv'
Plug 'tobyS/vmustache' " Dependency of pdv

" Vim / tmux sharing Ctrl-h/j/k/l for window / pane navigation
Plug 'christoomey/vim-tmux-navigator'

" Alignment Plugin, visually select and then use (`ga=`) to align on `=`
Plug 'junegunn/vim-easy-align'

" <leader>el on an variable creates an error log statement for it
Plug 'salcode/vim-error-log-shortcut'

" Load dictionaries with WordPress terms
Plug 'salcode/vim-wordpress-dict'

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
	silent! colorscheme badwolf
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

" Configure Folding Method to go from brace to brace in PHP
augroup fe_folding_php
	autocmd!
	autocmd FileType php setlocal foldmarker={,} foldmethod=marker foldlevelstart=1
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

" add `-` as part of the word in all situations
set iskeyword+=-

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
" polyfill for neovim and autoread
if has('nvim')
	augroup fe_autoread_behavior_neovim
		autocmd!
		autocmd FocusGained * silent! checktime
	augroup END
endif

" set leader to space key
let mapleader = "\<Space>"

" ALE Linter / Code Sniffing / Syntax Checker
let g:ale_php_phpcs_standard = 'WordPress'
let g:ale_linters = {
\   'php': ['phpcs'],
\}
" only run on save
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
" You can disable this option too
" if you don't want linters to run on opening a file
" let g:ale_lint_on_enter = 0

highlight clear ALEErrorSign

" ALE Linter shortcuts [w, ]w for prev/next error mapping.
nmap <silent> ]w <Plug>(ale_next_wrap)
nmap <silent> [w <Plug>(ale_previous_wrap)

" BufKill remove verbose messages
let g:BufKillVerbose = 0
" BufKill when a buffer is displayed in multiple windows 'kill'
"     rather than the default 'confirm'
let g:BufKillActionWhenBufferDisplayedInAnotherWindow = 'kill'

nnoremap <leader>cs :call CodeStandardsMenu()<cr>

function! CodeStandardsMenu()
	let l:myMakeTargets = ["abort", "Cancel", "WordPress", "PEAR", "PSR2"]
	let l:c = 0
	let l:c = confirm("Code Standards ","&Cancel\n&WordPress\n&PEAR\nPSR&2")

	if l:c == 2

		let g:ale_php_phpcs_standard = 'WordPress'
		let g:ale_linters = {
		\   'php': ['php', 'phpcs'],
		\}
	endif

	if l:c == 3
		let g:ale_linters = {
		\   'php': ['php'],
		\}
	endif

	if l:c == 4
		let g:ale_php_phpcs_standard = 'PSR2'
		let g:ale_linters = {
		\   'php': ['php', 'phpcs'],
		\}
	endif

	echo g:ale_linters
	echo g:ale_php_phpcs_standard

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

" Map X as delete to the black hole registry. Issue #112.
nnoremap X "_d
nnoremap XX "_dd
vnoremap X "_d

" Center next/prev match on screen when using n/N. Issue #110.
noremap n nzz
noremap N Nzz

" Select last paste with gb. Issue #109.
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" Map `<leader>ts2` to set expand (t)abs to (s)paces with (2) characters indicating a tab
nnoremap <leader>ts2 :set tabstop=2 softtabstop=2 shiftwidth=2 expandtab<CR>

" Map `<leader>ts4` to set expand (t)abs to (s)paces with (4) characters indicating a tab
nnoremap <leader>ts4 :set tabstop=4 softtabstop=4 shiftwidth=4 expandtab<CR>

" Map `<leader>tt2` to set (t)abs to be treated as (t)ab characters and display as (2) characters
nnoremap <leader>tt2 :set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab<CR>

" Map `<leader>tt4` to set (t)abs to be treated as (t)ab characters and display as (4) characters
nnoremap <leader>tt4 :set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab<CR>

" Map `<leader#>` to duplicate a line and comment out original one
nnoremap <leader># YpkI//<Space><Esc>j^

" Map Alt+, and Alt+. to decrease or increase vertical splits
nnoremap ≤ :vertical resize -5<CR>
nnoremap ≥ :vertical resize +5<CR>

" Map captilization typo commands to original commands
command! -bang -nargs=? -complete=file W w<bang> <args>
command! -bang -nargs=? -complete=file Wq wq<bang> <args>
command! -bang -nargs=? -complete=file WQ wq<bang> <args>

" EasyAlign Custom Rules
" See https://github.com/junegunn/vim-easy-align#extending-alignment-rules
let g:easy_align_delimiters = {
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] },
\ }
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Highlight the current line
set cursorline

" ~ toggles ' and " in addition to its normal behaviour
nnoremap <expr> ~ getline('.')[col('.')-1] == "'" ? "r\"l" : getline('.')[col('.')-1] == '"' ? "r'l" : '~'

" joonty/vdebug options.
if !exists('g:vdebug_options')
	" this code avoids an error on vim startup about
	" g:vdebug_options['path_maps'] being undefined
	let g:vdebug_options = {}
endif
" This is the path map for xdebug for my VVV installation. Unfortunately, we
" can't use ~ in the path.
let g:vdebug_options['path_maps'] = {"/srv/www": "/Users/sal/vagrant-local/www"}

" Set PDV template dir to default pdv templates.
let g:pdv_template_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h:h') . '/ironcode-vim/plugged/pdv/templates'

" Source $MYVIMRC when it is saved.
augroup VimReload
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" Monkey C (m4) support - for Garmin embedded device programming
" https://developer.garmin.com/downloads/connect-iq/monkey-c/doc/
augroup FeM4Comments
    autocmd!
	autocmd FileType m4 setlocal commentstring=//\ %s
augroup END

" Disable beep in MacVim. Issue #111.
if has("gui_macvim")
	augroup FeMacVim
		autocmd!
		autocmd GUIEnter * set vb t_vb=
	augroup END
endif

" In visual mode, when * (or ?) is pressed search for selected text.
vnoremap * y/<C-R>"<CR>
vnoremap ? y?<C-R>"<CR>

" J or K moves visual block down (or up).
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Re-select visual block after indenting.
vnoremap < <gv
vnoremap > >gv

" Map <tab> in insert mode to
" - insert <tab> when expandtab (which Vim will expand to spaces)
" - call our function when noexpandtab (i.e. \t is being used)
inoremap <expr> <tab> &expandtab ? "\<tab>" : '<C-R>=FeNoExpandTabIndentOnly()<CR>'

function! FeNoExpandTabIndentOnly() abort
	let l:aTabsWorthOfSpaces   = repeat(' ', &tabstop)
	let l:rowContent           = getline('.')
	let l:colPos               = col('.')
	let l:rowContentUpToColPos = strpart( l:rowContent, 0, l:colPos - 1)

	if l:rowContentUpToColPos =~ '\S'
		" The content before the cursor contains a non-whitespace character.
		return l:aTabsWorthOfSpaces
	else
		" The content before the cursor is exclusively whitespace characters.
		return "\t"
	endif
endfunction
