" - Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'scrooloose/nerdtree'

Plug 'scrooloose/nerdcommenter'

Plug 'morhetz/gruvbox'

Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/syntastic'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

Plug 'mattn/emmet-vim'

Plug 'pangloss/vim-javascript'

Plug 'mxw/vim-jsx'

call plug#end()

map <C-n> :NERDTreeToggle<CR>

colorscheme gruvbox
set background=dark
set number

inoremap jj <Esc>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
