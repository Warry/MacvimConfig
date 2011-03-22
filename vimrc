let mapleader="@"

" Shortcut to quickly toggle `set list`
nmap <leader>l :set list!<CR>

set nodigraph

" Open files quickly
nmap <D-@> :FufCoverageFile <CR>
inoremap <D-@> <Esc>:FufCoverageFile <CR>

"Invisible character colors
highlight NonText guifg=#cccccc
highlight SpecialKey guifg=#cccccc

" Use the same symbols as TextMate for tabstops, EOLs, spaces
set listchars=tab:▸\ ,eol:¬,trail:·

set ts=4
set sw=4

set list
set si
set number

set hlsearch
set incsearch

" Autoinsert, autoindent brachets
inoremap {<CR> {<CR>}<Esc>O


set dictionary+=~/.vim/dico.txt
set complete-=k complete+=k

colorscheme desert

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" source $VIMRUNTIME/mswin.vim
" behave mswin

if has("gui_macvim")
    let macvim_hig_shift_movement = 1
    set guioptions=egmrt
    vmap <S-C-Right> E
    vmap <S-C-Left> B
    vmap <S-M-Right> E
    vmap <S-M-Left> B
endif

au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim


set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Auto scroll 5 lines when cursor is at the limit of the window
set scrolloff=5

" Selection does not include current character
set selection=exclusive

function! SetTab(spaces)
  let spaces = a:spaces
  if a:spaces > 0
    echo a:spaces
    execute 'set tabstop='.spaces
    execute 'set shiftwidth='.spaces
    execute 'set expandtab'
  else
    set tabstop=4
    set shiftwidth=4
    set noexpandtab
  endif
endfunction

command -nargs=? ST :call SetTab(<f-args>)

