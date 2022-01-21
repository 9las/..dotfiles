" Load plugins
call plug#begin()

Plug 'base16-faded'

call plug#end()

" set t_Co=256 |" Might not be needed (see https://www.reddit.com/r/neovim/comments/cfdxo9/do_i_need_set_t_co256/)
syntax enable
colorscheme base16-faded
