" TIP: Source this with `:source %`

" Plugins
"""""""""

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'itchyny/lightline.vim'
  Plug 'dense-analysis/ale'
  Plug 'sheerun/vim-polyglot'
  Plug 'joukevandermaas/vim-ember-hbs'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'sgur/vim-editorconfig'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
call plug#end()


" Configuration
"""""""""""""""

syntax enable
set background=dark
colorscheme dracula
let g:lightline = { 'colorscheme': 'dracula', }
set noshowmode " Hide the current mode since it's already displayed in the status line

" Enable 24 bit true colors
if (has("termguicolors"))
  set termguicolors
endif

set number
set numberwidth=3
set encoding=utf-8
set hidden " keep buffers in memory. Enables switching buffers without saving
set nowrap
let g:ale_sign_column_always = 1 " Always show the sign gutter

" Default indentation
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" Show whitespace
" set list
" set listchars=eol:¬,tab:>·,extends:>,precedes:<,space:·


" Auto reload unchanged buffers when the file changes on disk.
" Src: https://unix.stackexchange.com/a/383044
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

source ~/.config/nvim/clipboard.vim

" Fuzzy finder mappings: https://www.reddit.com/r/vim/comments/cjsz2j/what_do_you_use_to_grep_through_entire/evgabqk
nmap <leader>f :Files<cr>|     " fuzzy find files in the working directory (where you launched Vim from)
nmap <leader>/ :BLines<cr>|    " fuzzy find lines in the current file
nmap <leader>b :Buffers<cr>|   " fuzzy find an open buffer
nmap <leader>r :Rg |           " fuzzy find text in the working directory
nmap <leader>c :Commands<cr>|  " fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
