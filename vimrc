" VIM Configuration - Vincent Jousse
" Cancel the compatibility with Vi. Essential if you want
" to enjoy the features of Vim
set nocompatible

"Activate pathogen
call pathogen#infect()

"Activate the NERDtree when launching vim
autocmd vimenter * NERDTree

" -- Display
set title                 " Update the title of your window or your terminal
set number                " Display line numbers
set ruler                 " Display cursor position
set wrap                  " Wrap lines when they are too long

set scrolloff=3           " Display at least 3 lines around you cursor
                          " (for scrolling)

set guioptions=T          " Enable the toolbar

" -- Search
set ignorecase            " Ignore case when searching
set smartcase             " If there is an uppercase in your search term
                          " search case sensitive again
set incsearch             " Highlight search results when typing
set hlsearch              " Highlight search results

" -- Beep
set visualbell            " Prevent Vim from beeping
set noerrorbells          " Prevent Vim from beeping

" Backspace behaves as expected
set backspace=indent,eol,start

" Hide buffer (file) instead of abandoning when switching
" to another buffer
set hidden

"Enable syntax highlighting
syntax enable

"Enable file specific behaviour-like syntax highlighting and indentation
filetype on
filetype plugin on
filetype indent on

"Use the dar version of Solarized
set background=dark
colorscheme solarized
set guifont=Monaco:h13
set antialias

"Disabling the directional keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"Press j twice in a row to exit insert mode
:imap jj <Esc>