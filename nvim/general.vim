" appearance {{{
set background=dark
set t_Co=256
colorscheme gruvbox
" }}}

" numbering {{{ 
" automatically set absolute number when losing focus
:au FocusLost * :set norelativenumber | :set number 
:au FocusGained * :set relativenumber | :set number
:set numberwidth=2

:set relativenumber | :set number
" automatically set absolute number when entering insert mode
autocmd InsertEnter * :set norelativenumber | :set number
" second set on next line: only current line 
autocmd InsertLeave * :set relativenumber | :set number 
" }}}

" folding {{{
set foldmethod=indent
" }}}

" various defaults {{{
set showcmd

" after some test, I prefer my vim without it
" set autochdir

set autoread
if &history < 1000
  set history=1000
endif

if &tabpagemax < 50
    set tabpagemax=50
endif

if !empty(&viminfo)
      set viminfo^=!
endif
set sessionoptions-=options

set undolevels=1000      " allow for as many undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.aux,*.fdb_latexmk,*.fls,*.pdf,*.bst,*.eps " Do not suggest these
set title                " change the terminal's title

" keep buffers instead of closing them. This deals with otherwise annoying
" buffer problems.
set hidden
set signcolumn=auto:2

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" get vim to resize splits after the size of the main window has been modified.
autocmd VimResized * wincmd =

" clipboard setting
set clipboard=unnamedplus
set clipboard=unnamed
let g:clipboard = {
			\   'name': 'myClipboard',
			\   'copy': {
			\      '+': 'pbcopy',
			\      '*': 'pbcopy',
			\   },
			\   'paste': {
			\      '+': '+',
			\      '*': '*',
			\   },
			\   'cache_enabled': 1,
			\ }
" }}}

