"   ___           __              ___       _
"  / _ | ___  ___/ /______ ___   / _ | ____(_)__ ____
" / __ |/ _ \/ _  / __/ -_|_-<  / __ |/ __/ / _ `(_-<
"/_/ |_/_//_/\_,_/_/  \__/___/ /_/ |_/_/ /_/\_,_/___/
"
" MY PERSONAL VIMRC FILE.
" ================================================
" LICENSE: USE THIS IF YOU LIKE, YOU CAN CHANGE
" WHATEVER YOU WANT, I DON'T CARE.
" ================================================

set nocompatible " This is VIm, be iMproved.
filetype off " Vundle requires this, don't ask me why.
" Disables the arrow keys, forces you to properly
" move around Vim
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" Move to beginning/end of line
" I find 0 and $ absurd, so I prefer
" using something more memorable like
" Shift+B (beginning) and Shift+E (end)
nnoremap B ^
nnoremap E $
let mapleader="," " Speaking of absurd, comma is more reachable than \.

" ==== UI OPTIONS ====
set nowrap " First annoyance: line wrapping, instantly disabled.
set number " Show line number
set relativenumber " Set relative number by default.  Easier for counting lines.
set ruler " Shows limit by line.
set showcmd " Shows commands on the lower bar.
set cursorline " Higlights the line where the cursor is currently at.
filetype indent on " Loads indentation options based on file extension.
set showmatch " Highlights parenthesis pairs.
set confirm " Asks if you want to save when you exit Vim.

" ==== TABS AND SPACES ====
set tabstop=4 " Inputs 4 spaces on TAB in Normal Mode.
set softtabstop=4 " Inputs 4 spaces on TAB in Insert Mode.
set expandtab " Tabs are spaces, fuck the Silicon Valley's scene on this.
set autoindent " Automatically indents.
set cindent " Proper C-like indent.

" ==== PLUGINS ====
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " Yo dawd, let Vundle manage Vundle 
Plugin 'octol/vim-cpp-enhanced-highlight' " Better C++ syntax highlighting.
Plugin 'tomasr/molokai'
Plugin 'fmoralesc/molokayo'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ==== THEMES ====
colorscheme molokai 
let g:airline_powerline_fonts = 1
let g:airline_theme = 'wombat'
