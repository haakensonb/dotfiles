" - Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'morhetz/gruvbox'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'scrooloose/nerdtree'

Plug 'airblade/vim-gitgutter'

Plug 'yggdroot/indentline'

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-commentary'

Plug 'christoomey/vim-tmux-navigator'

call plug#end()

colorscheme dracula
set background=dark
set number relativenumber
set expandtab
set smarttab
syntax on
filetype plugin indent on

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['^node_modules$']

" coc settings
"
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
