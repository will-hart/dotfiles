if has("gui_running")
  if has("gui_gtk2")
    set guifont=Hack\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Hack:h12:cANSI
  endif
endif

" use pathogen for plugins
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" plugin: https://github.com/tomasr/molokai
colorscheme molokai

" plugin: https://github.com/bling/vim-airline
set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" plugin: https://github.com/plasticboy/vim-markdown
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" tabs are two spaces
set expandtab
set shiftwidth=2
set softtabstop=2

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Handle prose and code modes. Borrowed from
" http://alols.github.io/2012/11/07/writing-prose-with-vim/
fun! SetProse()
  augroup PROSE
    autocmd!
    autocmd InsertEnter * set formatoptions+=a
    autocmd InsertLeave * set formatoptions-=a

    setlocal formatoptions=t1
    setlocal spell spelllang=en_gb

    noremap Q gqip
  augroup END
endfun

fun! SetCode()
  augroup CODE
    autocmd!
    silent! iunmap <buffer> .|
            \ silent! iunmap <buffer> !|
            \ silent! iunmap <buffer> ?|
            \ setlocal nospell list nowrap
            \     tw=74 fo=cqr1 showbreak=… nu|
            \ silent! autocmd! PROSE * <buffer>
  augroup END
endfun

fun! SetFileMode()
  if &ft =~ 'tex\|text\|markdown'
    call SetProse()
  else
    call SetCode()
  endif
endfun

autocmd FileType * call SetFileMode()
command! Code call SetCode()
command! Prose call SetProse()

" command to revert document to soft wraps
" http://alols.github.io/2012/11/07/writing-prose-with-vim/
command! -range=% SoftWrap
            \ <line2>put _ |
            \ <line1>,<line2>g/.\+/ .;-/^$/ join |normal $x

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

" Write backups to dir and with different filename
set backupdir=$HOME/Vim/backup//,.
set directory=$HOME/Vim/swap//,.
au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.vimbackup'

set backspace=2   " Backspace deletes like most programs in insert mode

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

" highlight last inserted text
nnoremap gV `[v`]
