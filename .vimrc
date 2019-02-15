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

Plugin 'VundleVim/Vundle.vim' " Yo dawg, let Vundle manage Vundle 
Plugin 'justinmk/vim-syntax-extra' " Better C syntax highlighting.
Plugin 'chriskempson/base16-vim' " Base15 color schemes.
Plugin 'vim-python/python-syntax' " Better Python syntax highlighting.
Plugin 'vim-airline/vim-airline' " The fresh little bar we all know and love.
Plugin 'vim-airline/vim-airline-themes' " Themes for the airline.
Plugin 'Raimondi/delimitMate' " Autocloses brackets and all that stuff.
Plugin 'Shougo/neosnippet.vim' " Snippets for efficient coding.
Plugin 'Shougo/neosnippet-snippets' " Snippet collecion.
Plugin 'honza/vim-snippets' " Moar snippets.
Plugin 'lervag/vimtex' " LaTeX utilities.
Plugin 'tpope/vim-surround' " Fast surrounding with brackets and stuff.
Plugin 'scrooloose/nerdcommenter' " Faster block commenting.
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim' " Fuzzy file finder.
Plugin 'w0rp/ale' " Async linter.

if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Async autocompletion.
else " Support for Vim 8
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ==== LOOK AND FEEL ====
syntax on
let base16colorspace=256
colorscheme base16-default-dark
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16' " The theme I like.
let g:python_highlight_all = 1 " Enables full Python syntax highlighting.

" ==== TAG JUMPING AND AUTOCOMPLETE ====
" Reads a tags file and uses that for autocompletion and file jumping tasks:
command! MakeTags !ctags -R . 
" Fast Deoplete enable at startup:
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()

" Map expression when a tab is hit:
"           checks if the completion popup is visible
"           if yes 
"               then it cycles to next item
"           else 
"               if expandable_or_jumpable
"                   then expands_or_jumps
"                   else returns a normal TAB
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Expands or completes the selected snippet/item in the popup menu
imap <expr><silent><CR> pumvisible() ? deoplete#mappings#close_popup() .
      \ "\<Plug>(neosnippet_jump_or_expand)" : "\<CR>"
smap <silent><CR> <Plug>(neosnippet_jump_or_expand)


" ==== BUILD AND ERROR CHECKING ====
autocmd QuickFixCmdPost * copen " Opens quick fix menu after :make
let g:airline#extensions#ale#enabled = 1

" ==== DOCUMENT AUTHORING ====
" I'm a huge LaTeX and Markdown nerd, so of course my vim setup will have some
" LaTeX and Markdown utilities that I use to make my document authoring easier.
autocmd BufRead,BufNewFile *.md setlocal spell " Auto spell check on MD files.
autocmd BufRead,BufNewFile *.md setlocal spelllang=es,en " Use both english and spanish.
autocmd BufRead,BufNewFile *.tex setlocal spell " Auto spell check on MD and TeX files.
autocmd BufRead,BufNewFile *.tex setlocal spelllang=es,en " Use both english and spanish.
autocmd FileType gitcommit setlocal spell " Auto spell check for git commit messages.
autocmd FileType gitcommit setlocal spelllang=es,en " Use both english and spanish.
let g:tex_flavor='latex' " Use LaTeX instead of ol' TeX.
set grepprg=grep\ -nH\ $*
let g:Tex_Folding=0 "I don't like folding.
set iskeyword+=:
" Changes the spell mistake highltight to a simple underline 
hi clear SpellBad
hi SpellBad cterm=underline

" ==== Leader key custom shortcuts ====
" change the mapleader from \ to ,
let mapleader=","
" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
" Adds a semicolon to the end of the line.
nnoremap <Leader>; A;<Esc>
" Yanks to the system clipboard.
nnoremap <Leader>c "+y
nnoremap <Leader>s :Files<CR>
