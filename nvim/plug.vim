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

" lightline (a simpler airline)
Plug 'itchyny/lightline.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Coc
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" ultisnips
Plug 'Sirver/ultisnips'
Plug 'honza/vim-snippets'

" latex
Plug 'lervag/vimtex'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" denite
Plug 'Shougo/denite.nvim'

" correct python indent
Plug 'Vimjas/vim-python-pep8-indent'

" ghosttext
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
" }}}


call plug#end()
" }}}

" settings {{{
" language client {{{2
set hidden
" }}}

" easymotion {{{2
augroup easymotion_highlights
	au!
	autocmd ColorScheme *
	  \ hi link EasyMotionTarget GruvboxOrangeBold |
	  \ hi link EasyMotionShade Comment
augroup END
" }}}

" COC {{{2
autocmd FileType json syntax match Comment +\/\/.\+$+
set completeopt=noinsert,menuone,noselect
set updatetime=300

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)
" }}}
"
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
" }}}

" vimtex {{{2
let g:tex_flavor = 'latex'
let g:vimtex_mappings_enabled = 1
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : 'latexbuild',
    \}
" }}}

" ultisnips {{{2 
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/bundle/UltiSnips', '~/.config/nvim/bundle/vim-snippets/UltiSnips', 'UltiSnips']

" for conceal markers
if has('conceal')
  set conceallevel=2 concealcursor=""
endif
" }}}

" denite {{{2
call denite#custom#option('default', {
			\ 'prompt': '❯'
			\ })

nnoremap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
nnoremap ; :Denite buffer -split=floating -winrow=1<CR>
nnoremap <leader>ù :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
nnoremap <leader>_ :<C-u>Denite grep:. -no-empty -mode=normal<CR>
" }}}

" }}}
