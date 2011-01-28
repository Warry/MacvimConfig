" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Open files quickly
nmap <D-@> :FufCoverageFile <CR>

"Invisible character colors
highlight NonText guifg=#cccccc
highlight SpecialKey guifg=#cccccc

" Use the same symbols as TextMate for tabstops, EOLs, spaces
set listchars=tab:▸\ ,eol:¬,trail:·


set ts=4
set sw=4

set list
set si

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
endif

au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim


set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Auto scroll 5 lines when cursor is at the limit of the window
set scrolloff=5
