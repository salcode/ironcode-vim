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

" Solarized Color Scheme Plugin {{{
" https://github.com/altercation/vim-colors-solarized
" -------------------------------------------------------------
" Color scheme for vim
Bundle 'altercation/vim-colors-solarized'

" }}}

" Syntastic Plugin {{{
" https://github.com/scrooloose/syntastic
" -------------------------------------------------------------
" Marks incorrect syntax lines with `>>` in the left side of the
" editor (the gutter).  Installed for PHP syntax checking but
" supports other languages, as well.
Bundle 'scrooloose/syntastic'

" }}}

" Vim Abolish Plugin {{{
" https://github.com/tpope/vim-abolish
" -------------------------------------------------------------
" Installed specifically for format coercion (fooBar)
" - `cr_` or `crs` (coerce to snake_case) e.g. "foo_bar"
" - `crm` (coerce to MixedCase) e.g. FooBar
" - `crc` (coerce to camelCase) e.g. fooBar
" - `cru` (coerce to UPPER_CASE) e.g. FOO_BAR
" - `cr-` or `crk` (coerce to dash-case (kebab case)) e.g. foo-bar
"
" This plugin also does other things but they go
" unused in my workflow
Bundle 'tpope/vim-abolish'
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

" Vim Better Whitespace {{{
" https://github.com/ntpeters/vim-better-whitespace
" -------------------------------------------------------------
" Highlight trailing whitespace
" `:StripWhitespace` strip trailing whitespace
" `:ToggleWhitespace` toggle whitespace trailing
Bundle 'ntpeters/vim-better-whitespace'

" `<leader>sws` runs :StripWhitespace
nnoremap <leader>sws :StripWhitespace<CR>

" }}}

" Vim Fugitive Plugin {{{
" https://github.com/tpope/vim-fugitive
" -------------------------------------------------------------
" Run Git commands directly from vim and looks for tags file in
" /.git, which is import for ctags setup
Bundle 'tpope/vim-fugitive'

" }}}

" Vim Repeat Plugin {{{
" https://github.com/tpope/vim-repeat
" -------------------------------------------------------------
" Extends repeat functionality to plugins,
" particuarly __Vim Surround__, __Vim Abolish__,
" and __Vim Commentary__.
Bundle 'tpope/vim-repeat'

" }}}

" Vim Surround Plugin {{{
" https://github.com/tpope/vim-surround
" -------------------------------------------------------------
" Surround Default Vim Settings
" Adding and manipulating surround delimiters.
"
" #### Examples
" - __abc zyx jjj__ `ysiw{` surround word cursor is on with braces __abc { zyx } jjj__
" - __"abc zyx jjj"__ `cs"'` change surround from " to ' __'abc zyx jjj'__
" - __abc zyx jjj__ `ys3w<p class="intro">` surround 3 words with HTML paragraph tag
" ```
" <p class="intro">abc zyx jjj</p>
" ```
" - __abc zyx jjj__ `yS3w<p class="intro">` surround 3 words with HTML paragraph tag (capital S causes tags on own lines)
" ```
" <p class="intro">
"     abc zyx jjj
" </p>
" ```
Bundle 'tpope/vim-surround'

" }}}

" Vim Sensible Plugin {{{
" https://github.com/tpope/vim-sensible
" -------------------------------------------------------------
" Sensible Default Vim Settings
Bundle 'tpope/vim-sensible'

" }}}

" UltiSnips Plugin {{{
" https://github.com/SirVer/ultisnips
" -------------------------------------------------------------
" Vim Snippets
" `wpcpt<tab>` will trigger WordPress CPT snippet
Bundle 'SirVer/ultisnips'

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

" General Settings {{{
" -------------------------------------------------------------

	" Display Settings {{{
	" -------------------------------------------------------------
	" show invisible characters
	set list

	" show line numbers
	set number

	" do not wrap lines
	set nowrap

	" Syntax Highlighing
	syntax enable
	syntax on

	" }}}

	"  Word Boundary Settings {{{
	" -------------------------------------------------------------
	" add keyword characters '-' and '$'
	" so they are no longer word boundaries, this allows them to be selected as
	" part of the word
	set iskeyword+=-,$

	" }}}

	" File and Backup Settings {{{
	" -------------------------------------------------------------
	" do not create a backup file before overwrite
	set nobackup

	" write a temporary backup file that is removed once
	" the original is successfully overwritten
	set writebackup

	" do all work in memory, no swap file
	set noswapfile

	" if a file is changed outside Vim, automatically re-read it
	set autoread

	" }}}

	" Search Settings {{{
	" -------------------------------------------------------------
	" ignore case when searching
	set ignorecase
	" ...unless the search uses uppercase letters
	set smartcase

	" highlight search results
	set hlsearch

	" increment search
	set incsearch

	" }}}

	" Register Settings {{{
	" -------------------------------------------------------------
	" use clipboard as primary register for y,d,p
	set clipboard=unnamed

	" }}}

	" Tabs and Spaces Settings {{{
	" -------------------------------------------------------------
	" See __Modify Tabs and Spaces Settings Mappings__ for mappings
	" to modify quickly

	" use shiftwidth for size of tab at beginning of line
	set smarttab

	" a tab is 4 spaces
	set tabstop=4

	" auto indent (<< or >>) is 4 spaces
	set shiftwidth=4

	" copy indent from current line when starting a new line
	set autoindent

	" }}}

	" Folding Settings {{{
	" -------------------------------------------------------------
	" Filetype vim set fold method to marker
		augroup fe_vim_folding
			autocmd!
			autocmd FileType vim setlocal foldmethod=marker
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

	" add command :WSUDO to write with sudo {{{
	" -------------------------------------------------------------
	" `:WSUDO` prompts the user for the root password and writes the
	" file (using the __sudo__functionality)
	command! WSUDO w !sudo tee % > /dev/null
	" }}}

	" Window Mappings {{{
	" -------------------------------------------------------------
	" shortcuts for window navigation
	" Ctrl+h (left), Ctrl+j (down), etc.
	nnoremap <C-H> <C-W>h
	nnoremap <C-J> <C-W>j
	nnoremap <C-K> <C-W>k
	nnoremap <C-L> <C-W>l
	" }}}

	" Buffer Mappings {{{
	" -------------------------------------------------------------
	" Ctrl + Tab for next buffer
	nnoremap <C-Tab> :bnext<CR>

	" Ctrl + Shift + Tab for previous buffer
	nnoremap <C-S-Tab> :bprevious<CR>

	" <F5> to open a buffer menu, type buffer number and hit enter to switch
	nnoremap <F5> :buffers<CR>:buffer<Space>

	" }}}

	" Modify Tabs and Spaces Settings Mappings {{{
	" -------------------------------------------------------------
	" Map `<leader>ts2` to set expand (t)abs to (s)paces with (2) characters indicating a tab
	nnoremap <leader>ts2 :set tabstop=2 softtabstop=2 shiftwidth=2 expandtab<CR>

	" Map `<leader>ts4` to set expand (t)abs to (s)paces with (4) characters indicating a tab
	nnoremap <leader>ts4 :set tabstop=4 softtabstop=4 shiftwidth=4 expandtab<CR>

	" Map `<leader>tt2` to set (t)abs to be treated as (t)ab characters and display as (2) characters
	nnoremap <leader>tt2 :set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab<CR>

	" Map `<leader>tt4` to set (t)abs to be treated as (t)ab characters and display as (4) characters
	nnoremap <leader>tt4 :set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab<CR>
	" }}}

	" Time Save Mappings {{{
	" -------------------------------------------------------------
	" PHP only `<leader>el` wraps the variable under cursor
	" in an error log statement with print_r
	augroup php_error_log
		autocmd!
		autocmd FileType php nnoremap <leader>el ^vg_daerror_log( '<esc>pa=' . print_r( <esc>pa, true ) );<cr><esc>
	augroup END

	" Map <leader>ev (i.e. ,ev) to edit .vimrc
	" and <leader>sv to source (apply) .vimrc
	nnoremap <leader>ev :split $MYVIMRC<cr>
	nnoremap <leader>sv :source $MYVIMRC<cr>

	" Map <leader>eg (i.e. ,eg) to edit .gvimrc
	" and <leader>sg to source (apply) .gvimrc
	nnoremap <leader>eg :split $MYGVIMRC<cr>
	nnoremap <leader>sg :source $MYGVIMRC<cr>

	"  }}}
" }}}
