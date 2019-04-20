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

" autocompletion with NCM2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" Buffers and paths
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

" Additional
Plug 'ncm2/ncm2-ultisnips'

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

" tmux
Plug 'christoomey/vim-tmux-navigator'

" indentguides
Plug 'thaerkh/vim-indentguides'

" markdown mathjax
Plug 'drmingdrmer/vim-syntax-markdown'

" language client
Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
			\ }
" }}}


call plug#end()
" }}}

" settings {{{
" language client {{{2
set hidden

let g:LanguageClient_serverCommands = {
			\ 'python': ['pyls'],
			\ 'tex': ['java', '-jar', '~/texlab/texlab.jar'],
			\ }

let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')
" }}}

" easymotion {{{2
augroup easymotion_highlights
	au!
	autocmd ColorScheme *
	  \ hi link EasyMotionTarget GruvboxOrangeBold |
	  \ hi link EasyMotionShade Comment
augroup END
" }}}

" NCM2 {{{2

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

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

" }}}
