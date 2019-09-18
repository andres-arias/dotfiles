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
set clipboard=unnamedplus " Defaults to the system clipboard
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript " Loads TypeScript syntax highlighting.
au FileType cpp set iskeyword-=:

" ==== TABS AND SPACES ====
set tabstop=4 " Inputs 4 spaces on TAB in Normal Mode.
set softtabstop=4 " Inputs 4 spaces on TAB in Insert Mode.
set expandtab " Tabs are spaces, fuck the Silicon Valley's scene on this.
set shiftwidth=4 " When indenting with '>', use 4 spaces width
set autoindent " Automatically indents.
set cindent " Proper C-like indent.
set shiftwidth=4 " Avoid double indent.

" ==== PLUGINS ====
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " Yo dawg, let Vundle manage Vundle 
Plugin 'justinmk/vim-syntax-extra' " Better C syntax highlighting.
Plugin 'octol/vim-cpp-enhanced-highlight' " Better C++ syntax highlighting.
Plugin 'aonemd/kuroi.vim' " The colorscheme I use.
Plugin 'vim-python/python-syntax' " Better Python syntax highlighting.
Plugin 'pangloss/vim-javascript' " Better JavaScript syntax highlighting.
Plugin 'leafgarland/typescript-vim' " TypeScript syntax highlighting.
Plugin 'vim-airline/vim-airline' " The fresh little bar we all know and love.
Plugin 'vim-airline/vim-airline-themes' " Themes for the airline.
Plugin 'Raimondi/delimitMate' " Autocloses brackets and all that stuff.
Plugin 'tpope/vim-surround' " Fast surrounding with brackets and stuff.
Plugin 'tpope/vim-repeat' " Repeat commands from plugins.
Plugin 'scrooloose/nerdcommenter' " Faster block commenting.
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim' " Fuzzy file finder.
Plugin 'benmills/vimux' " Send commands to tmux via vim.
Plugin 'christoomey/vim-tmux-navigator' " Seamless navigation between Vim and Tmux.
Plugin 'honza/vim-snippets' " Snippets for quick coding.
Plugin 'Valloric/MatchTagAlways' " Highlights matching HTML tags

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ==== LOOK AND FEEL ====
syntax on
let base16colorspace=256
colorscheme kuroi
set background=dark
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16' " The theme I like.
let g:python_highlight_all = 1 " Enables full Python syntax highlighting.

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

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
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

" ==== Custom shortcuts ====
" change the mapleader from \ to ,
let mapleader=","
" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
" Adds a semicolon to the end of the line.
nnoremap <Leader>; A;<Esc>
nnoremap <Leader>s :Files<CR>
" Runs a command in a tmux pane.
nnoremap <Leader>vp :VimuxPromptCommand<CR>
" Re-run last tmux command on a tmux pane.
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
" Zooms tmux pane.
nnoremap <Leader>vz :VimuxZoomRunner<CR>
" Easier pane navigation:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
