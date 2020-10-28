
" Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required

" Stolen from $VIMRUNTIME/vimrc_example.vim
" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" More of my stuff

set backupdir=.vim/,~/.vim/,/tmp//
set directory=.vim/,~/.vim/,/tmp//
set undodir=.vim/,~/.vim/,/tmp//

set textwidth=80
set expandtab
set tabstop=4
set shiftwidth=4
set guioptions=!a
set nohlsearch
set spelllang=en
set autoindent

au BufNewFile,BufRead *.launch set filetype=xml
au BufNewFile,BufRead *.sdf set filetype=xml

au FileType css setlocal tabstop=2 | setlocal shiftwidth=2
au FileType javascript setlocal tabstop=2 | setlocal shiftwidth=2
au FileType typescript setlocal tabstop=2 | setlocal shiftwidth=2
au FileType html setlocal tabstop=2 | setlocal shiftwidth=2
au FileType xml setlocal tabstop=2 | setlocal shiftwidth=2

augroup tex_mappings
    au FileType tex,latex,plaintex setlocal spell
    au FileType tex,latex,plaintex onoremap 
            \ <buffer> <silent> i$ :<c-u>normal! T$vt$<cr>
    au FileType tex,latex,plaintex onoremap
            \ <buffer> <silent> a$ :<c-u>normal! F$vf$<cr>
    au FileType tex,latex,plaintex vnoremap <buffer> i$ T$ot$
    au FileType tex,latex,plaintex vnoremap <buffer> a$ F$of$
augroup end

" Mouse settings
set ttymouse=xterm2
set mouse=a

nnoremap <Enter> o<ESC>
nnoremap Y y$

inoremap jw <ESC>
cnoremap jw <C-c>
snoremap jw <ESC>

" Go to the closing tag.
nnoremap <leader>t vat<ESC>
" Go to the opening tag.
nnoremap <leader>T vato<ESC>

" Replace the selected expression with it evaluated
nnoremap <leader>m c<C-r>=<C-r>"<CR><ESC>
vnoremap <leader>m c<C-r>=<C-r>"<CR><ESC>

nnoremap <leader>c :!ctags -R<CR>

set fillchars+=vert:\ ,fold:-
