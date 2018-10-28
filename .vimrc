"VIM Configuration 

"Cancel the compatibility with Vi. Essential if you want to enjoy the features of Vim
set nocompatible

"Activate pathogen
call pathogen#infect()

"Activate the NERDtree when launching vim
autocmd vimenter * NERDTree

"Switch to editor buffer when opening, instead of being focused on NERDTree
autocmd VimEnter * wincmd p

"Keep nerdtree plugin to the right
let g:NERDTreeWinPos = "right"

"Close VIM if NERDTree is the last opened buffer
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

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
"colorscheme solarized " instead of VIM themes, we use terminal colors
set background=dark
set guifont=Monaco:h13
set antialias

" Color fix when using iTerm2
set termguicolors

" Clear search highlights after 'Enter' or ':' or 'Backspace' key is pressed
nnoremap <cr> :noh<CR><CR>:<backspace>

"Press j twice in a row to exit insert mode
:imap jj <Esc>
