filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'amix/vim-zenroom'

call vundle#end()            " required
filetype plugin indent on    " required
set nocompatible
 
filetype indent plugin on
 
syntax on
 
set hidden

set wildmenu
 
set showcmd
 
set hlsearch

set ignorecase

set smartcase
 
set autoindent
 
set nostartofline
 
set ruler
 
set laststatus=2
 
set confirm
 
set visualbell

set t_vb=

set mouse=a

set cmdheight=2
 
set number
 
set notimeout ttimeout ttimeoutlen=200
 
set pastetoggle=<F11>
 
set clipboard=unnamedplus
"------------------------------------------------------------
" Indentation options {{{1

set shiftwidth=4
set softtabstop=4
set expandtab
  
 
"------------------------------------------------------------
" Mappings {{{1
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
:map <F6> :NERDTree <CR>
:map <F7> :tabn <CR> 
:map <F8> :tabp <CR>
:map <F9> :tabe
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

execute pathogen#infect()
call pathogen#helptags()
autocmd StdinReadPre * let s:std_in=1

"Inicializa Vim con NERDtree:
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd vimenter * NERDTree

set cursorline
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

set background=dark
colorscheme solarized

" Octave syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

let g:airline_powerline_fonts=1
