" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

let mapleader=" "

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)


" make vim autocomplete like bash
"set wildmode=longest,file


set backup
" where to put backup file (don't forget to make a backup directory)
set backupdir=~/vimbackup,/var/tmp
" directory is the directory for temp file
set directory=~/tmp,/var/tmp,/tmp


colorscheme zenburn
" I cant stand the default popup menu colors. This makes them readable. (and
" overwrites all themes set prior to this line
hi PMenuSel       term=standout  guifg=black guibg=gray  
hi PMenu       term=standout  guifg=black guibg=magenta  
hi CursorLine       term=standout  guifg=black guibg=gray  



" make W save as well as w
command W w
command Wq wq


" removing date to make more room
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ \ \ [%{fugitive#statusline()}]\ \ \ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
set statusline=%<%f\ \ %{fugitive#statusline()}\ %{strftime(\"%H:%M\ %d\-%b\",getftime(expand(\"%:p\")))}%=\ lin:%l\ col:%c%V\ %P
" now set it up to change the status color line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif



" 'x only takes you to row, `x takes you to row + col
nnoremap ' `
nnoremap ` '



"set colorcolumn=100
" relative line numbers
"set rnu

set spell!
set number


set tabstop=2
set shiftwidth=2
set expandtab
call pathogen#infect()


syntax enable
let g:solarized_termtrans = 1
colorscheme solarized
set background=light
