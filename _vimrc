colorscheme molokai

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Hack\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Hack:h12:cANSI
  endif
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" tabs are two spaces
set tabstop=2
set softtabstop=2
set shiftround
set expandtab

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Get off my lawn (thoughtbot for ignore arrow keys)
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Ctrl+Backspace deletes a word
imap <C-BS> <C-W>

" arrow keys move to next line
set whichwrap+=<,>,[,]

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

set number           " show line numbers
set numberwidth=5

set showcmd          " show command in bottom bar
set cursorline       " highlight current line

filetype plugin indent on   "load filetype-specific indent files

set wildmenu         " visual autocomplete for command menu

set lazyredraw       " only redraw screen where necessary

set showmatch        " highlight matching braces

set incsearch        " search as you type
set hlsearch         " highlight matches during search

" turn off search highlight with ,<space>
nnoremap <leader><space> :nohlsearch<CR>

" set foldenable        " enable folding
" set foldlevelstart=10 " open most folds by default
" set foldnestmax=10    " 10 nested folds max
" nnoremap <space> za   " space open/closes folds
" set foldmethod=indent " fold based on indent level

" move vertically by visual line
" nnoremap j gj
" nnoremap k gk

" move to beginning/end of line
" nnoremap B ^
" nnoremap E $

" $/^ doesn't do anything
" nnoremap $ <nop>
" nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]