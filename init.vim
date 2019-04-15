" Python-client settings {{{
let mapleader = "\<Space>"

" if in conda virtual env, use virtual env python, and 
" install pylint and neovim if not already present
" if !empty($CONDA_PREFIX)
" 	let g:python3_host_prog = $CONDA_PREFIX."/bin/python"
" 	silent execute "!pip install pylint"
" 	silent execute "!pip install neovim"
" else
" endif

let g:python3_host_prog = $HOME."/miniconda3/envs/neovim3/bin/python"
let g:python_host_prog = $HOME."/miniconda3/envs/neovim2/bin/python"
" }}}

" Sourcing external {{{
source $HOME/.config/nvim/plug.vim
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/line.vim
" }}}
