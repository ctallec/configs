let g:airline#extensions#tabline#enabled = 1 "enable the line at top
let g:airline_powerline_fonts = 1 

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
set laststatus=2 "No need to split before you have status line
