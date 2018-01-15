call pathogen#infect() " Llama Pathogen (administra runtime).

" ==== Opciones de UI ====
syntax enable " Activa el syntax hightlight
set number " Muestra los numeros de linea.
set showcmd " Muestra los comandos en la barra inferior.
set cursorline " Destaca la linea en la que se encuentra el cursor.
:hi CursorLine cterm=NONE ctermbg=DarkGrey ctermfg=white guibg=DarkGrey ctermfg=white " Cambia el cursorline a un hightlight en gris
filetype indent on " Carga opciones de indentacion segun extension de achivo.
set wildmenu " Autocompletacion visual para el menu de comandos.
set lazyredraw " No molestarse con redraws de pantalla.
set showmatch " Destaca pares de parentesis o corchetes.
set confirm " Pregunta si desea guardar al salir.

" ==== Folding ====
" Folding es basicamente contraer y expandir bloques de codigo
" delimitados por llaves.

set foldenable " Activa el folding.
set foldlevelstart=99 " Todos los folds estan abiertos al abrir archivo.
set foldnestmax=10 " Maximo 10 folds anidados (evite mas, tf).
nnoremap <space> za " za abre o cierra el fold del bloque actual.
set foldmethod=indent " Se basa en indentaciones para hacer el fold.

" ==== Tabs y espacio ====

set tabstop=4 " Ingresa 4 espacios en TAB en Normal Mode.
set softtabstop=4 " Ingresa 4 espacios en TAB en Insert Mode.
set expandtab " Tabs son espacios (Preferible para Python).

" ==== Busqueda ====

set incsearch " Busca conforme se va escribiendo.
set hlsearch " Destaca matches.
noremap <leader><space> :nohlsearch<CR> " Apaga el highlight con ,<space>
let g:ackprg = 'ag --nogroup --nocolor --column' " Usa Ag (requiere Silver Searcher y ack.vim).

" ==== Navegacion ====

" Movimiento vertical sin saltarse wraps
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`] " Destaca el bloque recientemente insertado.

" ==== Leader Key ====

let mapleader="," " Cambia leader a la coma, mas comodo que \.
nnoremap <leader>u :GundoToggle<CR> " Muestra visualmente el arbol undo. Requiere el plugin gundo.vim
nnoremap <leader>s :mksession<CR> " Abre lo ultimo abierto con vim -S

" ==== Opciones de CtrlP ====

let g:ctrlp_match_window = 'bottom,order:ttb' " Ordena matches de arriba para abajo.
let g:ctrlp_switch_buffer = 0 " Abre archivos en nuevos buffers.
let g:ctrlp_working_path_mode = 0 " Permite cambiar directorio de trabajo sin que CtrlP se ponga en varas.

" ==== Backups ====
set backup " Hace copias de seguridad.
" Lo siguiente es para que mueva copias de seguridad a /tmp
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" ==== Plugins (Requiere Vundle) ====

" Inicializa Vundle:
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " Activa Vundle.
Plugin 'tpope/vim-fugitive' " Comandos de Git dentro de Vim
Plugin 'vim-gitgutter' " Muestra diff de Git en la barra izquierda.
Plugin 'vim-airline/vim-airline' " Barra de estado inferior super fancy.
Plugin 'vim-airline/vim-airline-themes' " Temas para la airline.
Plugin 'scrooloose/nerdtree' " Navegador de archivos visual.
Plugin 'Xuyuanp/nerdtree-git-plugin' " Estados de git dentro del NERDTree
Plugin 'amix/vim-zenroom' " Zen mode: Elimina distracciones. Leader+V
Plugin 'townk/vim-autoclose' " Autoclose de parentesis.
Plugin 'Valloric/YouCompleteMe' " Autocompleta codigo (un dolor de instalar)

" ==== Opciones de NERDTree ====

" Inicializa Vim con NERDTree:
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd vimenter * NERDTree
nnoremap <leader>n :NERDTree<CR> " Abre NERDTree con Leader+n

" ==== Opciones de Airline ====
let g:airline_powerline_fonts=1 " Usa powerline fonts, entonces se ve bonito.
