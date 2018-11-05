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
"
" I keep this file as documented as possible, so I 
" don't forget what I need, also, if someone else
" finds this useful, so they know what they're getting.
"
" REMEMBER TO INSTALL VUNDLE!

set nocompatible " This is VIm, be iMproved.
filetype off " Vundle requires this, don't ask me why.
" Disables the arrow keys, forces you to properly
" move around Vim
set incsearch " Incremental search, for /
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
" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>; A;<Esc>

" ==== UI OPTIONS ====
set nowrap " First annoyance: line wrapping, instantly disabled.
set number " Show line number
set relativenumber " Set relative number by default.  Easier for counting lines.
set ruler " Shows the informative ruler at the lower part of the screen.
set showcmd " Shows commands on the lower bar.
set cursorline " Higlights the line where the cursor is currently at.
filetype indent on " Loads indentation options based on file extension.
set showmatch " Highlights parenthesis pairs.
set confirm " Asks if you want to save when you exit Vim.
" Highlights the text when it goes past the 80-line limit:
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" ==== TABS AND SPACES ====
set tabstop=4 " Inputs 4 spaces on TAB in Normal Mode.
set softtabstop=4 " Inputs 4 spaces on TAB in Insert Mode.
set expandtab " Tabs are spaces, fuck the Silicon Valley's scene on this.
set autoindent " Automatically indents.
set cindent " Proper C-like indent.
set shiftwidth=4 " Avoid double indent.

" ==== PLUGINS ====
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " Yo dawd, let Vundle manage Vundle 
Plugin 'octol/vim-cpp-enhanced-highlight' " Better C++ syntax highlighting.
Plugin 'tomasr/molokai' " Theme based on Sublime's Monokai.
Plugin 'vim-python/python-syntax' " Better Python syntax highlighting.
Plugin 'vim-airline/vim-airline' " The fresh little bar we all know and love.
Plugin 'vim-airline/vim-airline-themes' " Themes for the airline.
Plugin 'Townk/vim-autoclose' " Shameful I know, autocloses bracks and all that stuff.
Plugin 'vim-syntastic/syntastic' " Linter, I need this for checking syntax now and then.
Plugin 'tpope/vim-obsession' " Stores sessions between restarts.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ==== LOOK AND FEEL ====
colorscheme molokai 
let g:airline_powerline_fonts = 1 " So it looks cool, instead of blocky.
let g:airline_theme = 'wombat' " The theme I like.
let g:python_highlight_all = 1 " Enables full Python syntax highlighting.

" ==== SYNTASTIC OPTIONS ====
" Leader+c keybind to call Syntastic and check for errors
nnoremap <leader>c :SyntasticCheck<CR>

" ==== NETRW OPTIONS ====
" I normally used  the NERDTree plugin, but I want
" to keep my vim as light and snappy as possible, so
" I only install a plugin if it's completely necessary.
" In this case, Vim's built-in netrw can fulfill
" NERDTree's functionality with a few tweaks.
" I'm still not completely sold tho.
let g:netrw_banner = 0 " Disables the useless help banner.
let g:netrw_liststyle = 3 " Tree view as default.
let g:netrw_browse_split = 4 " Opens in previous window.
let g:netrw_altv = 1 " Opens in vertical split when something is open.
let g:netrw_winsize = 25 " Makes netrw window slimmer.
nnoremap <leader>n :Vex<CR> " Maps leader + n to netrw in vertical split.

" ==== TAG JUMPING AND AUTOCOMPLETE ====
" Reads a tags file and uses that for autocompletion and file jumping tasks:
command! MakeTags !ctags -R . 

" ==== SNIPPETS ===
" Without UltiSnips? Yes, it's possible, ugly, but possible.
" Inserts a std::cout template:
nnoremap ,cout o<Esc>:-1read $HOME/.snippets/stdcout<CR>4e2li 
