call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'github/copilot.vim'
Plug 'prabirshrestha/vim-lsp'

call plug#end()

imap <silent><script><expr> <C-e> copilot#Accept('\<CR>')
let g:copilot_no_tab_map = v:true


syntax on                   " syntax highlighting
set number
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
filetype plugin indent on   "allow auto-indenting depending on file type
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
