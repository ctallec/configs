" JK binding {{{
inoremap jk <esc>
tnoremap jj <C-\><C-n>
" }}}

" source config {{{
nnoremap <Leader>sv :source $MYVIMRC<cr>
" }}}

" windows navigation {{{
nnoremap <m-l> <c-w>l
nnoremap <m-k> <c-w>k
nnoremap <m-j> <c-w>j
nnoremap <m-h> <c-w>h
" }}}

" save and quit mappings {{{
nnoremap <Leader>s :w<cr>
nnoremap <Leader>q :q<cr>
" }}}

" nerdtree {{{
nmap <silent> <Leader>n :NERDTreeToggle<cr>
" }}}

" easymotion {{{
" beginning of line jump
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" end of line jump
map <Leader>l <Plug>(easymotion-wl)
map <Leader>h <Plug>(easymotion-bl)
" }}}

" gitgutter {{{
nmap <Leader><Leader>hs <Plug>GitGutterStageHunk
nmap <Leader><Leader>hp <Plug>GitGutterPreviewHunk
nmap <Leader><Leader>hr <Plug>GitGutterUndoHunk
nmap <Leader><Leader>hu <Plug>GitGutterUndoHunk
" }}}

" fugitive {{{
nmap <Leader>g :Gstatus<CR>
nmap <Leader><Leader>g :Gpush<CR>
nmap <Leader><Leader>p :Gpull<CR>
" }}}

" deoplete {{{
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
" }}}

" ultisnips {{{
inoremap <c-k> <Plug>(ultisnips_expand)
inoremap <silent> <expr> <c-k> ncm2_ultisnips#expand_or("\<c-k>", 'n')

let g:UltiSnipsExpandTrigger = "<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsRemoveSelectModeMappings = 0
" }}}

" fuzzy search {{{
nnoremap <Leader>d :Ag<CR>
nnoremap <Leader>D :Lines<CR>
" }}}

" vimtex {{{
nmap <Leader>tv <Plug>(vimtex-view)
nmap <Leader>tl <Plug>(vimtex-compile)
nmap <Leader>te <Plug>(vimtex-errors)
" }}}

" tagbar {{{
nmap <Leader>tt :TagbarToggle<CR>
" }}}

" completion helper window {{{
nnoremap <Leader>p :pclose<CR>
" }}}

" make {{{
nnoremap <Leader>mm :make<CR>
nnoremap <Leader>mc :make clean<CR>
" }}}
