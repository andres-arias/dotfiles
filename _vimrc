"   ___           __              ___       _
"  / _ | ___  ___/ /______ ___   / _ | ____(_)__ ____
" / __ |/ _ \/ _  / __/ -_|_-<  / __ |/ __/ / _ `(_-<
"/_/ |_/_//_/\_,_/_/  \__/___/ /_/ |_/_/ /_/\_,_/___/
"
" MY PERSONAL VIMRC FILE.
" WINDOWS WITH GVIM EDITION
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
set encoding=utf-8
set backspace=2 " Enable backspace on Windows

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
set clipboard=unnamed " Defaults to the system clipboard
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript " Loads TypeScript syntax highlighting.
set iskeyword-=:

" ==== TABS AND SPACES ====
set tabstop=2 " Inputs 4 spaces on TAB in Normal Mode.
set softtabstop=2 " Inputs 4 spaces on TAB in Insert Mode.
set expandtab " Tabs are spaces, fuck the Silicon Valley's scene on this.
set shiftwidth=2 " When indenting with '>', use 4 spaces width
set autoindent " Automatically indents.
set cindent " Proper C-like indent.
set shiftwidth=2 " Avoid double indent.

" ==== PLUGINS ====
" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " Yo dawg, let Vundle manage Vundle 
Plugin 'aonemd/kuroi.vim' " The colorscheme I use.
Plugin 'vim-python/python-syntax' " Better Python syntax highlighting.
Plugin 'pangloss/vim-javascript' " Better JavaScript syntax highlighting.
Plugin 'vim-airline/vim-airline' " The fresh little bar we all know and love.
Plugin 'vim-airline/vim-airline-themes' " Themes for the airline.
Plugin 'Raimondi/delimitMate' " Autocloses brackets and all that stuff.
Plugin 'tpope/vim-surround' " Fast surrounding with brackets and stuff.
Plugin 'tpope/vim-repeat' " Repeat commands from plugins.
Plugin 'scrooloose/nerdcommenter' " Faster block commenting.
Plugin 'SirVer/ultisnips' " Snippet engine
Plugin 'honza/vim-snippets' " Snippets for quick coding.
Plugin 'martinda/Jenkinsfile-vim-syntax' " Syntax highlighting for Jenkinsfiles.
Plugin 'cespare/vim-toml' " TOML syntax highlighting.
Plugin 'tomasiser/vim-code-dark' " Theme for the airline.
Plugin 'ctrlpvim/ctrlp.vim' " Simple fuzzy-finder
Plugin 'preservim/nerdtree' " Tree-like navigation
Plugin 'ryanoasis/vim-devicons' " NERDTree icons representing the file type.
Plugin 'Xuyuanp/nerdtree-git-plugin' " NERDTree icons for git status
Plugin 'nvie/vim-flake8' " Static style checker for Python
Plugin 'neoclide/coc.nvim', {'branch': 'release'} " Autocomplete engine
Plugin 'Valloric/MatchTagAlways' " Highlights matching HTML tags
Plugin 'AndrewRadev/tagalong.vim' " Automatic renaming of matching HTML tags
Plugin 'leafgarland/typescript-vim' " Syntax highlight for TypeScript

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ==== LOOK AND FEEL ====
syntax on
let base16colorspace=256
colorscheme kuroi
set background=dark
let g:airline_powerline_fonts = 1
let g:airline_theme = 'codedark' " The theme I like for the airline
let g:python_highlight_all = 1 " Enables full Python syntax highlighting.
if has("gui_running")
  set guifont=FiraMono\ NF:h12
endif
au BufNewFile,BufRead Jenkinsfile setf groovy

" ==== TAG JUMPING AND AUTOCOMPLETE ====
" Reads a tags file and uses that for autocompletion and file jumping tasks:
command! MakeTags !ctags -R . 

" ==== BUILD AND ERROR CHECKING ====

autocmd QuickFixCmdPost * copen " Opens quick fix menu after :make
let g:airline#extensions#ale#enabled = 1

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ==== DOCUMENT AUTHORING ====
" I'm a huge LaTeX and Markdown nerd, so of course my vim setup will have some
" LaTeX and Markdown utilities that I use to make my document authoring easier.
autocmd BufRead,BufNewFile *.md setlocal spell " Auto spell check on MD files.
autocmd BufRead,BufNewFile *.md setlocal spelllang=es,en " Use both english and spanish.
autocmd BufRead,BufNewFile *.tex setlocal spell " Auto spell check on MD and TeX files.
autocmd BufRead,BufNewFile *.tex setlocal spelllang=es,en " Use both english and spanish.
let g:tex_flavor='latex' " Use LaTeX instead of ol' TeX.
set grepprg=grep\ -nH\ $*
let g:Tex_Folding=0 "I don't like folding.
set iskeyword+=:
" Changes the spell mistake highltight to a simple underline 
hi clear SpellBad
hi SpellBad cterm=underline

" ==== Custom shortcuts ====
" change the mapleader from \ to ,
let mapleader=","
" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
" Adds a semicolon to the end of the line.
nnoremap <Leader>; A;<Esc>
" Opens the file fuzzy finder
nnoremap <Leader>s :CtrlP<CR>
" Start NERDTree and put the cursor back in the other window:
autocmd VimEnter * NERDTree | wincmd p
let g:NERDTreeGitStatusUseNerdFonts = 1 " Enable Nerd Fonts on NERDTree
" Toggle NERDTree (I normally don't keep it open)
nnoremap <C-n> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Easier pane navigation:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Trigger snippets
let g:UltiSnipsExpandTrigger="<C-s>"

" Autocomplete configuration
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
