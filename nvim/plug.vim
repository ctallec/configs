" Installs {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/bundle')

" plugins {{{2
" plugin manager
Plug 'gmarik/Vundle.vim'

" nerdtree
Plug 'scrooloose/nerdtree'

" colorscheme
Plug 'morhetz/gruvbox'

" easier motions
Plug 'easymotion/vim-easymotion'

" vim-airline -- cool status-bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" syntax setting / linting
Plug 'neomake/neomake'

" autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi'
Plug 'zchee/deoplete-jedi'
" lua related
Plug 'xolox/vim-misc'
Plug 'xolox/vim-lua-ftplugin'
" C++ related
Plug 'zchee/deoplete-clang'
" java related
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

" ultisnips
Plug 'Sirver/ultisnips'
Plug 'honza/vim-snippets'

" correct indentation python
Plug 'Vimjas/vim-python-pep8-indent'

" search related
" fuzzy searching
Plug 'mileszs/ack.vim' 
let g:ackprg = 'ag --nogroup --nocolor --column'

" search matches highlighting
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" Integration of fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

" latex
Plug 'lervag/vimtex'

" tags
Plug 'majutsushi/tagbar'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" indentguides
Plug 'thaerkh/vim-indentguides'

" markdown mathjax
Plug 'drmingdrmer/vim-syntax-markdown'
" }}}


call plug#end()
" }}}

" settings {{{
" easymotion {{{2
augroup easymotion_highlights
	au!
	autocmd ColorScheme *
	  \ hi link EasyMotionTarget GruvboxOrangeBold |
	  \ hi link EasyMotionShade Comment
augroup END
" }}}

" neomake {{{2
" launch neomake on write
autocmd! BufWritePost * Neomake

" open neomake window on error
let g:neomake_open_list = 2

" change neomake error and warning signs
let g:neomake_error_sign = {
        \ 'text': '✗',
        \ 'texthl': 'ErrorMsg',
        \ }
let g:neomake_warning_sign = {
        \   'text': '☢',
         \   'texthl': 'NeomakeWarningSign',
         \ }

" change neomake signs color
augroup neomake_signs
	au!
	autocmd ColorScheme *
	  \ hi NeomakeErrorSign ctermfg=DarkRed ctermbg=Black |
	  \ hi NeomakeWarningSign ctermfg=Yellow ctermbg=Black
augroup END

" change neomake highlights
augroup neomake_highlights
	au!
	autocmd ColorScheme *
	  \ hi link NeomakeError GruvboxRedBold |
	  \ hi link NeomakeWarning GruvboxOrangeBold 
augroup END

" only enable pylint {{{
let g:neomake_python_mypy_maker = {
			\ 'exe': 'mypy',
			\ }
			" \ 'args': ['--ignore-missing-i']
			" \}

let g:neomake_python_enabled_makers = ['flake8', 'mypy']
" }}}

" only enable chktex {{{
let g:neomake_tex_enabled_makers = []
" }}}

" deoplete {{{2

" setting up
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
if !exists('g:deoplete#omni#functions')
	let g:deoplete#omni#functions = {}
endif
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" shows docstring in preview window
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#ignore_errors = v:true

" sources for autocompletion are, in this order, file, ultisnips and jedi
let g:deoplete#sources = {}
let g:deoplete#sources['python'] = ['file', 'ultisnips', 'jedi']

" increases length of completion list
let g:deoplete#max_abbr_width = 200

" deoplete is slow as fuck
let g:deoplete#sources#jedi#server_timeout = 50

" C++ completion config
let g:deoplete#sources#clang#libclang_path='/usr/lib/llvm-3.8/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/lib/llvm-3.8/lib/clang'

" lua completion config
let g:lua_check_syntax = 0
let g:lua_complete_omni = 1
let g:lua_complete_dynamic = 0
let g:lua_define_completion_mappings = 0

let g:deoplete#omni#functions.lua = 'xolox#lua#omnifunc'
let g:deoplete#omni#input_patterns.lua = '\w+|[^. *\t][.:]\w*'

" java completion config
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
" }}}

" fuzzy searching {{{2
function! s:config_easyfuzzymotion(...) abort
	  return extend(copy({
	    \   'converters': [incsearch#config#fuzzy#converter()],
	    \   'modules': [incsearch#config#easymotion#module()],
	    \   'keymap': {"\<CR>": '<Over>(easymotion)'},
	    \   'is_expr': 0,
	    \   'is_stay': 1
	    \ }), get(a:, 1, {}))
endfunction

nnoremap <silent><expr> <Leader>/ incsearch#go(<SID>config_easyfuzzymotion())

" }}}

" vimtex {{{2
let g:tex_flavor = 'latex'
let g:vimtex_mappings_enabled=1
" }}}

" ultisnips {{{2 
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/bundle/UltiSnips', '~/.config/nvim/bundle/vim-snippets/UltiSnips', 'UltiSnips']

" for conceal markers
if has('conceal')
  set conceallevel=0 concealcursor=""
endif

" }}}

" tagbar {{{2
let g:tagbar_map_showproto="<Leader>s"
" }}}
" }}}
