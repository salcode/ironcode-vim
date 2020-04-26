call plug#begin()

" Reverse the order of commits in a git interactive rebase
Plug 'salcode/vim-interactive-rebase-reverse'

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

" Add undo tree exploration with :UndotreeToggle
Plug 'mbbill/undotree'

" View git commit for current line with <leader>gm (:GitMessenger)
Plug 'rhysd/git-messenger.vim'

" Look for ctags file in .git directory
Plug 'tpope/vim-fugitive/'

" Add PHP.net docs with SHIFT+k overkeyword key binding.
Plug 'alvan/vim-php-manual'
" Prevent mapping Ctrl+h to open the manual page in PHP.net
let g:php_manual_online_search_shortcut = ''

" Add WordPress dictionary and syntax to PHP files
Plug 'salcode/vim-wordpress-dict'

" Add common mappings
Plug 'tpope/vim-unimpaired/'

" Automatically record session on exit
Plug 'tpope/vim-obsession/'

" Add syntax checking
Plug 'dense-analysis/ale'

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

" Load vdebug for working with xdebug
Plug 'vim-vdebug/vdebug'

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

" Enable filetype detection
filetype on
" Load filetype plugins
filetype plugin on
" Load indent file based on filetype
filetype indent on

" Copy indent from current line when starting a new line
set autoindent

" Allow backspacing over: autoindent, line breaks, and start of line
" (see :help 'backspace')
set backspace=indent,eol,start

" Remove included files from areas to scan for keyword completion
" (see :help 'complete')
set complete-=i

" Do not interpret numbers that start with a zero as octal when using CTRL-A,
" CTRL-X for increment/decrement.
set nrformats-=octal

" Always display status bar.
set laststatus=2

" When <Tab> is pressed in command-line mode, display possible matches.
set wildmenu

" Correct color display in Vim in Tmux
" See https://salferrarello.com/vim-tmux-iterm-broken-colors/
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

colorscheme badwolf

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

" show absolute line number on current line, relative line number on all others
set number relativenumber

augroup fe_absolute_line_number_toggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" display tabs as taking up 4 spaces
set tabstop=4

" set << and >> to move 4 columns
set shiftwidth=4

" use 'shiftwidth' when inserting a <Tab> in front of a line
set smarttab

" use the tab character (not spaces)
set noexpandtab

" if this number were less than tabstop, pressing tab in insert mode
" would insert a combination of the tab character and spaces
set softtabstop=4

" highlight all search matches after search is complete
set hlsearch

" ignore case when searching
set ignorecase

" override ignorecase if the search pattern contains upper case characters
set smartcase
set incsearch
" Preview effects of command incrementally (e.g. :substitute). Neovim only.
if has('nvim')
	set inccommand=nosplit
endif

" add `-` as part of the word in all situations
set iskeyword+=-

" Start diff mode with vertical splits (used for Fugitive's Gdiff)
set diffopt=vertical

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
let g:ale_linters = {
\   'php': ['phpcs'],
\}
" Run ALE Linter on save (only).
let g:ale_lint_on_save = 1
" Do NOT run ALE Linter when text is changed but not saved.
let g:ale_lint_on_text_changed = 0
" Do NOT run ALE Linter when a file is opened.
let g:ale_lint_on_enter = 0

highlight clear ALEErrorSign

" ALE Linter shortcuts [w, ]w for prev/next error mapping.
nmap <silent> ]w <Plug>(ale_next_wrap)
nmap <silent> [w <Plug>(ale_previous_wrap)

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
" Map Alt+a and Alt+x. to increase and decrease vertical splits respectively
nnoremap ≈ :vertical resize -5<CR>
nnoremap å :vertical resize +5<CR>

" Map captilization typo commands to original commands
command! -bang -nargs=? -complete=file W w<bang> <args>
command! -bang -nargs=? -complete=file Wq wq<bang> <args>
command! -bang -nargs=? -complete=file WQ wq<bang> <args>

" EasyAlign Custom Rules
" See https://github.com/junegunn/vim-easy-align#extending-alignment-rules
let g:easy_align_delimiters = {
\ '$': {
\      'pattern':       '$\+',
\      'right_margin':  0,
\      'stick_to_left': 0,
\      'ignore_groups': ['!Comment']  },
\ '\': {
\     'pattern':         '\\' },
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

	" set font and font size for GUI
	set guifont=Monaco:h13
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

" <leader>c to create a copy of the current file in the same directory.
nnoremap <silent> <Leader>c :clear<bar>silent exec "!cp '%:p' '%:p:h/%:t:r-copy.%:e'"<bar>redraw<bar>echo "Copied " . expand('%:t') . ' to ' . expand('%:t:r') . '-copy.' . expand('%:e')<cr>

" :BD and :BD! call BufDeleteKeepSplit(0) and BufDeleteKeepSplit(1) respectively
command! -bang BD call BufDeleteKeepSplit(<bang>0)

" :BufOnly closes all buffers except the current one
command! BufOnly execute '%bdelete|edit #|normal `"'

" :JSONFormat custom command to format for a given range (or current line).
command! -range JSONFormat <line1>,<line2>!python -m json.tool

" Close buffer while keeping the split open.
" @param bang Is a 0 or 1 indicating if the command ended with a bang (!).
"     i.e. close the buffer even if it is modified.
function! BufDeleteKeepSplit(bang) abort
	" Get current buffer's number. See :help bufnr
	" :help bufname explains '%' is the current buffer
	let buffer_to_close_number = bufnr('%')

	" Check if the buffer is modified since last save.
	" AND bang parameter is zero.
	" When bang parameter is zero, we do not close the buffer.
	" See :help getbufvar
	" See :help modified
	" Note: '&mod' works in place of '&modified'
	if getbufvar(buffer_to_close_number, '&modified') && ! a:bang
		echohl ErrorMsg
		echo "No write since last change (add ! to override)"
		echohl None
		return
	endif

	" Since we checked for modified buffers above, we can use the
	" bang versions of these commands to ignore if a buffer is modified.
	" See :help bprevious
	execute "bprevious!"

	" Check if the 'buffer to close' is a listed buffer.
	" bdelete makes a buffer unlisted so we can not call it on an already
	" unlisted buffer.  See :help unlisted-buffer
	if buflisted(buffer_to_close_number)
		execute "bdelete! " . buffer_to_close_number
	endif

endfunction

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

" Add :Ag command, which behaves like :grep but uses
" the ag command instead of grep
function! FeAg(func)
  let tmp1=&grepprg
  let tmp2=&grepformat
  set grepprg=ag\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
  exe "grep ".a:func
  exe "set grepprg=".escape(tmp1,' ')
  exe "set grepformat=".escape(tmp2, ' ')
endf
command! -nargs=* Ag :silent call FeAg("<args>")

" Set vdebug_options.
" Note: the path_maps will need to be updated when changing between projects.
let g:vdebug_options= {
\    "port" : 9000,
\    "server" : '',
\    "timeout" : 20,
\    "on_close" : 'detach',
\    "break_on_open" : 0,
\    "ide_key" : '',
\    "path_maps" : {
\        '/app/public/': '/Users/sal/localsites/sf/app/public'
\    },
\    "debug_window_level" : 0,
\    "debug_file_level" : 0,
\    "debug_file" : "",
\    "watch_window_style" : 'compact',
\    "marker_default"     : '⬦',
\    "marker_closed_tree" : '▸',
\    "marker_open_tree" : '▾'
\}

" Look for a project specific vdebug path maps file in the current directory.
" If the file is present, use the first line as the 'local path'.
" If the file has a second line, use the second line as the 'remote path'.
"
" Example .vdebug_path_maps
" /Users/sal/localsites/mysite/app/public
" /app/public/
"
" To load the project specific vdebug path maps, the file must be in the
" current directory when Vim/Neovim is launched.
function! FeLocalVDebugPathMaps(filename)
	if ! filereadable(a:filename)
		" Exit early, unable to read project vdebug path maps file."
		return
	endif
	if ! exists("g:vdebug_options")
		" Exit early g:vdebug_options does not exist.
		return
	endif
	if has_key(g:vdebug_options, 'path_maps')
		" g:vdebug_options['path_maps'] exists, store original
		" values to use as defaults.
		let l:remote_path = keys(g:vdebug_options['path_maps'])[0]
		let l:local_path  = values(g:vdebug_options['path_maps'])[0]
	else
		" We default the local path to the system root directory.
		" This value is unlikely to work but the hope is this will be
		" overwritten by the project vdebug path maps file.
		let l:remote_path  = '/'
	endif

	let l:project_vdebug_settings = readfile(a:filename)
	if ! len(l:project_vdebug_settings)
		" Exit early, the project vdebug path maps file does
		" not have any information.
		return
	endif

	" Update the local_path with the value from the project vdebug
	" path maps file.
	let l:local_path = l:project_vdebug_settings[0]

	if 2 == len(l:project_vdebug_settings)
		" Update the remote_path with the value from the project vdebug
		" path maps file.
		let l:remote_path = l:project_vdebug_settings[1]
	endif

	" Update vdebug_options['path_maps'] with the new value(s).
	let g:vdebug_options["path_maps"] = {l:remote_path: l:local_path}
endf

" Attempt to load a project specific vdebug path map file from the
" current directory.
exe "call FeLocalVDebugPathMaps('.vdebug_path_maps')"

" Add normal command 'S' to intelligently split a line.
" See https://github.com/drzel/vim-split-line
nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>

" --------------------------------------
" --  Begin Git staging Hunks Helpers --
" --------------------------------------
function! UnAddLine()
	" Store current position
	let position = winsaveview()
	" Jump to second line
	execute ":2"
	" Move to the last number.
	execute ":normal 2t@h"
	" Decrement the value under the cursor.
	execute ':normal ' . "\<C-X>"
	" Restore position
	call winrestview(position)
	" Delete current line
	execute ":normal dd"
endfunction

function! UnDeleteLine()
	" Store current position
	let position = winsaveview()
	" Jump to second line
	execute ":2"
	" Move to the last number.
	execute ":normal 2t@h"
	" Increment the value under the cursor.
	execute ':normal ' . "\<C-A>"
	" Restore position
	call winrestview(position)
	" Remove the leading - sign
	execute "normal 0r "
endfunction

function! DeleteLine()
	" Store current position
	let position = winsaveview()
	" Jump to second line
	execute ":2"
	" Move to the last number.
	execute ":normal 2t@h"
	" Decrement the value under the cursor.
	execute ':normal ' . "\<C-X>"
	" Restore position
	call winrestview(position)
	" Add a leading - sign
	execute "normal 0r-"
endfunction

function! GitHunkToggle()
	if IsFirstCharacter('-')
		call UnDeleteLine()
	elseif IsFirstCharacter('+')
		call UnAddLine()
	elseif IsFirstCharacter(' ')
		call DeleteLine()
	endif
endfunction

augroup fe_git_commit_hunk
	autocmd!
	autocmd FileType diff nnoremap <buffer> <leader><leader> :call GitHunkToggle()<CR>
augroup END

function! IsFirstCharacter(characterToCompare) abort
	let l:rowContent           = getline('.')
	let l:colPos               = col('.')
	let l:firstCharacter = strpart( l:rowContent, 0, 1)
	" echo l:firstCharacter
	if l:firstCharacter ==# a:characterToCompare
		return 1
	endif
endfunction
" --------------------------------------
" --- End Git staging Hunks Helpers ----
" --------------------------------------
