" Vundle {{{
" -------------------------------------------------------------
set nocompatible    " be iMproved, required
filetype off        " required by Vundle, re-enabled below

" set runtime path
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage vundle
Plugin 'gmarik/vundle'

" starting point
Bundle 'tpope/vim-sensible'

" searching and file management
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-vinegar'
Bundle 'kien/ctrlp.vim'

" Alignment, commenting, surround, repeat
Bundle 'tpope/vim-commentary'
Bundle 'junegunn/vim-easy-align'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-abolish'

" Hints
Bundle 'SirVer/ultisnips'
Bundle 'shawncplus/phpcomplete.vim'

" Syntax
Bundle 'scrooloose/syntastic'
Bundle 'plasticboy/vim-markdown'
Bundle 'StanAngeloff/php.vim'

" colors
Bundle 'altercation/vim-colors-solarized'

" Dash
Bundle 'rizzatti/dash.vim'

" Status Line
Bundle 'bling/vim-airline'

" Git
" run Git commands, directly from vim (and look for tags file in /.git)
Bundle 'tpope/vim-fugitive'
" display Git status for each line in the gutter
Bundle 'airblade/vim-gitgutter'

" re-enable filetype
" must be after all Vundle Bundles are loaded
filetype on

" }}}

" Appearance {{{
" -------------------------------------------------------------

" show invisibles
set list

" set display characters for invisibles
set listchars=eol:¬,tab:▸\ ,trail:~,extends:>,precedes:< " decides what whitespace to shaw

" by default do not wrap lines
set nowrap

" when wrap is set to on, break at logicial points (set in breadat)
set linebreak

" line numbers
set number

" Syntax Highlighing
syntax enable
syntax on

" Setting colorscheme light
set background=light

" Plugin Vim Markdown disable folding
let g:vim_markdown_folding_disabled=1

" netrw (and plugin vinegar) add line numbers
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" Filetype vim set fold method to marker
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" Behavior {{{
" -------------------------------------------------------------

" allow backspacing over autoindent, line breaks, and start of insert
set backspace=indent,eol,start

" add keyword characters '-' and '$'
" so they are no longer word boundaries, this allows them to be selected as
" part of the word
set iskeyword+=-,$

" Remove trailing whitespace for these filetypes
augroup remove_trailing_whitespace
	autocmd!
	autocmd FileType vim,php,c,cpp,css,java,ruby,javascript,scss autocmd BufWritePre * :%s/\s\+$//e
augroup END

" Change default comments in PHP to // ( instead of /* */ )
augroup FeCommentaryPhpDoubleSlash
	autocmd!
	autocmd FileType php setlocal commentstring=//\ %s
augroup END

" }}}

" Status Line {{{
" -------------------------------------------------------------
set laststatus=2                        " Enable statusline
set t_Co=256
let g:airline_theme='solarized'

set statusline=
set statusline+=%tyru                    " tail of the filename
set statusline+=%=                      " left/right separator
set statusline+=%c,                     " cursor column
set statusline+=%l/%L                   " cursor line/total lines
set statusline+=\ %P                    " percent through file

	" ### Buffers in airline status bar (plugin) {{{
	" Enable the list of buffers
	let g:airline#extensions#tabline#enabled = 1

	" Show just the filename
	let g:airline#extensions#tabline#fnamemod = ':t'
	" }}}

" }}}

" Files and backups {{{
" -------------------------------------------------------------
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" do not create a backup file before overwrite
set nobackup

" write a temporary backup file that is removed once
" the original is successfully overwritten
set writebackup

" do all work in memory, no swap file
set noswapfile

" if a file is changed outside Vim, automatically re-read it
set autoread

" allow project level .vimrc files
set exrc

" load plugin files for specific file types (needed for plugin NerdCommenter)
filetype plugin on

	" file patterns to ignore {{{
	" Ignore output and VCS files
	set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

	" Ignore image files
	set wildignore+=*.psd,*.png,*.jpg,*.gif,*.jpeg

	" Ignore archive files
	set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

	" Ignore bundler and sass cache
	set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

	" Ignore temp and backup files
	set wildignore+=*.swp,*~,._*

	" Ignore Node and JS files
	set wildignore+=*/node_modules/*,*.min.js

	" Ignore WP Language files
	set wildignore+=*.pot,*.po,*.mo

	" Ignore Fonts
	set wildignore+=*.eot,*.eol,*.ttf,*.otf,*.afm,*.ffil,*.fon,*.pfm,*.pfb,*.woff,*.svg,*.std,*.pro,*.xsf

	" }}}
" }}}

" Search {{{
" -------------------------------------------------------------
" ignore case when searching
set ignorecase
" ...unless the search uses uppercase letters
set smartcase

" highlight search results
set hlsearch

" incriment search
set incsearch

" Plugin Ack use ag (the silver searcher) in place of ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" Plugin CTRL P, when performing tag search ignore the following
let g:ctrlp_custom_ignore =['debug[[dir]]', 'gravity[[dir]]', 'akismet[[dir]]', 'user-switching[[dir]]', 'wp-migrate-db-pro[[dir]]', 'upgrade[[dir]]', 'uploads[[dir]]', 'twenty*[[dir]]']

" }}}

" Registers {{{

" use clipboard as primary register for y,d,p
set clipboard=unnamed

" }}}

" Tab and Indentation Settings {{{
" -------------------------------------------------------------

" use shiftwidth for size of tab at beginning of line
set smarttab

" a tab is 4 spaces
set tabstop=4

" auto indent (<< or >>) is 4 spaces
set shiftwidth=4

" copy indent from current line when starting a new line
set autoindent

" }}}

" Mapping {{{
" -------------------------------------------------------------
" map leader to comma
let mapleader = ","
let g:mapleader = ","

" Map <leader>ev (i.e. \ev) to edit .vimrc
" and <leader>sv to source (apply) .vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Map <leader>eg (i.e. \eg) to edit .gvimrc
" and <leader>sg to source (apply) .gvimrc
nnoremap <leader>eg :split $MYGVIMRC<cr>
nnoremap <leader>sg :source $MYGVIMRC<cr>

" map j to gj and k to gk, so line navigation ignores line wrap
" http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'

" add command :WSUDO
" to write with sudo
command! WSUDO w !sudo tee % > /dev/null

" add command :WS
" Write with Spaces - allows the write command to execute while suspending
" autocmd (i.e. saves without regexp to remove trailing spaces)
command! WS noautocmd w

	" ### Shortcuts to Modify Tabs/Spaces {{{

	" Map <leader>ts2 to expand (t)abs to (s)paces with (2) characters indicating a tab
	nnoremap <leader>ts2 :set tabstop=2 softtabstop=2 shiftwidth=2 expandtab<CR>

	" Map <leader>ts4 to expand (t)abs to (s)paces with (4) characters indicating a tab
	nnoremap <leader>ts4 :set tabstop=4 softtabstop=4 shiftwidth=4 expandtab<CR>

	" Map <leader>tt2 to (t)abs to be treated as (t)ab characters and display as (2) characters
	nnoremap <leader>tt2 :set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab<CR>

	" Map <leader>tt4 to (t)abs to be treated as (t)ab characters and display as (4) characters
	nnoremap <leader>tt4 :set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab<CR>

	" }}}

	" ### Window / View Port Mapping {{{

	" <leader>= adjusts viewports to be all the same size
	noremap <leader>= <C-w>=

	" shortcuts for window navigation
	" Ctrl+h (left), Ctrl+j (down), etc.
	nnoremap <C-H> <C-W>h
	nnoremap <C-J> <C-W>j
	nnoremap <C-K> <C-W>k
	nnoremap <C-L> <C-W>l

	" }}}

	" ### Buffer Management {{{

	" Ctrl + Tab for next buffer
	nnoremap <C-Tab> :bnext<CR>

	" Ctrl + Shift + Tab for previous buffer
	nnoremap <C-S-Tab> :bprevious<CR>

	" <leader>bd to delete the current buffer but keep the window split open
	nnoremap <leader>bd! :bnext\|bdelete #<CR>

	" <F5> to open a buffer menu, type buffer number and hit enter to switch
	nnoremap <F5> :buffers<CR>:buffer<Space>
	" }}}

" Plugin EasyAlign, create command shortcut A
" e.g. :A =>
" aligns on =>
com! -bang -range -nargs=* A <line1>,<line2>call easy_align#align('<bang>' == '!', 0, '', <q-args>)

" Plugin EasyAlign, <Enter> in Visual Mode triggers interactive align
" e.g. 4V<Enter>
" selection 4 lines and enters interactive align mode
vmap <Enter> <Plug>(EasyAlign)

" Plugin Ack <leader>f search
nnoremap <leader>f :Ack<space>

" Plugin Vim Commentary <leader>c<SPACE> to toggle comment on current line
nmap <leader>c<SPACE> <Plug>CommentaryLine

" Plugin CTRL P tag search
nnoremap <leader>p :CtrlPTag<cr>

" REMOVED to test
" phpcomplete disable Ctrl+] (was conflicting)
" see https://github.com/curtismchale/WPTT-Vim-Config/issues/62
" https://github.com/shawncplus/phpcomplete.vim/issues/48
" let g:phpcomplete_enhance_jump_to_definition = 0

" PHP Filetype <leader>el - to wrap variable under cursor in an error log statement
augroup php_error_log
	autocmd!
	autocmd FileType php nnoremap <leader>el ^vg_daerror_log( '<esc>pa=' . print_r( <esc>pa, true ) );<cr><esc>
augroup END

" }}}
