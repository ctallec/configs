let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
			\ },
			\ 'component_function': {
			\   'cocstatus': 'coc#status',
			\   'gitbranch': 'fugitive#head'
			\ },
			\ 'enable': {
			\   'statusline': 1,
			\   'tabline': 1
			\ },
			\ 'tabline': {
			\    'left': [ [ 'tabs' ] ],
		        \    'right': [ [ 'close' ] ] } 
			\ }

set showtabline=2
set laststatus=2
