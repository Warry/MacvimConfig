
let mapleader=";"
set mouse=a
syntax on

set ts=4
set sw=4

set list
set si
set number

set hlsearch
set incsearch


" Quick selection
function! SelectIndent ()
  let temp_var=indent(line("."))
  while indent(line(".")-1) >= temp_var
    exe "normal k"
  endwhile
  exe "normal V"
  while indent(line(".")+1) >= temp_var
    exe "normal j"
  endwhile
endfun
nmap <Space><Space> :call SelectIndent()<CR>
nmap <Space> vi
nmap <S-Space> va

" clear search
nmap <leader>n :noh<CR>

set nodigraph
set shortmess=I
set nowrap

" Open files quickly
nmap <D-1> :FufFile <CR>
inoremap <D-1> <Esc>:FufFile <CR>
nmap <D-±> :FufBuffer <CR>
inoremap <D-±> <Esc>:FufBuffer <CR>
nmap <D-§> :FufCoverageFile <CR>
inoremap <D-§> <Esc>:FufCoverageFile <CR>
let g:bufExplorerShowRelativePath=1

" buffer sizes
map <C-M-D-RIGHT> :vertical res +10<CR>
map <C-M-D-DOWN> :res +10<CR>
map <C-M-D-LEFT> :vertical res -10<CR>
map <C-M-D-UP> :res -10<CR>
map <C-M-D-=> <C-W>=

" buffer nav
map <C-M-LEFT> <C-w><LEFT>
map <C-M-UP> <C-w><UP>
map <C-M-DOWN> <C-w><DOWN>
map <C-M-RIGHT> <C-w><RIGHT>

" starting
map <leader>§ <C-W>v<C-W>v<C-W>s

" open quick
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>s :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>v :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>t :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Shift selection
map <S-LEFT> <Esc>vh
map <S-UP> <Esc>vk
map <S-DOWN> <Esc>vj
map <S-RIGHT> <Esc>vl
map <S-M-LEFT> <Esc>vb
map <S-M-UP> <Esc>v{
map <S-M-DOWN> <Esc>v}
map <S-M-RIGHT> <Esc>vw
map <S-D-LEFT> <Esc>v0
map <S-D-UP> <Esc>vgg
map <S-D-DOWN> <Esc>vG
map <S-D-RIGHT> <Esc>v$

inoremap <S-LEFT> <Esc>vh
inoremap <S-UP> <Esc>vk
inoremap <S-DOWN> <Esc>vj
inoremap <S-RIGHT> <Esc>vl
inoremap <S-M-LEFT> <Esc>vb
inoremap <S-M-UP> <Esc>v{
inoremap <S-M-DOWN> <Esc>v}
inoremap <S-M-RIGHT> <Esc>vw
inoremap <S-D-LEFT> <Esc>v0
inoremap <S-D-UP> <Esc>vgg
inoremap <S-D-DOWN> <Esc>vG
inoremap <S-D-RIGHT> <Esc>v$

vmap <S-LEFT> h
vmap <S-UP> k
vmap <S-DOWN> j
vmap <S-RIGHT> l
vmap <S-M-LEFT> b
vmap <S-M-UP> {
vmap <S-M-DOWN> }
vmap <S-M-RIGHT> w
vmap <S-D-LEFT> 0
vmap <S-D-UP> gg
vmap <S-D-DOWN> G
vmap <S-D-RIGHT> $

map <M-LEFT> b
map <M-UP> {
map <M-DOWN> }
map <M-RIGHT> w


" Use the same symbols as TextMate for tabstops, EOLs, spaces
"set listchars=tab:▸\ ,eol:¬,trail:·

" Autoinsert, autoindent brachets
inoremap {<CR> {<CR>}<Esc>O

set dictionary+=~/.vim/dico.txt
set complete-=k complete+=k

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

au Filetype html,xml,xsl,tl source ~/.vim/scripts/closetag.vim
au BufNewFile,BufRead *.less set filetype=less

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

" Auto scroll 5 lines when cursor is at the limit of the window
set scrolloff=3

" Selection does not include current character
set selection=inclusive

function! SetTabsLength(spaces)
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
command! -nargs=? ST :call SetTabsLength(<f-args>)
nmap <leader>i :set expandtab! <CR>

function! SearchAll(tar, ep)
  let tar = a:tar
  let ep = a:ep
  execute 'vimgrep /'.ep.'/ **/'.tar
  execute 'copen'
endfunction
command! -nargs=? F :call SearchAll('*', <f-args> )
command! -nargs=? L :call SearchAll('*.less', <f-args> )
command! -nargs=? J :call SearchAll('*.js', <f-args> )
command! -nargs=? H :call SearchAll('*.html', <f-args> )


" do no keep a backup file, use versions instead
set nobackup

" show the cursor position all the time
set ruler

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"set listchars=tab:▸\ ,eol:¬

if has("gui_macvim")
  "let macvim_hig_shift_movement=0
  set guioptions=egmrt
  set listchars=tab:▸\ ,eol:¬,trail:·
  set guifont=Inconsolata\-dz\ for\ Powerline:h12
else
endif

" Theme"
set background=dark
colorscheme base16-flat

"Invisible character colors
highlight NonText guifg=#354C55
highlight SpecialKey guifg=#354C55
set cursorline




let g:fuf_dir_exclude = '.target'
let g:fuf_mrufile_exclude = '\v\.DS_Store|\.git|\.swp|\.svn||target|\v\.class'
let g:fuf_file_exclude = '\v\.DS_Store|\.git|\.swp|\.svn|target|\v\.class'


source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2

