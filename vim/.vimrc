
" Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required

" Use this command to install vundle:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" PLUGINS
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plugin 'xuhdev/vim-latex-live-preview'
" Surround.vim
Plugin 'https://tpope.io/vim/surround.git'
" UltiSnips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Vim Wiki
Plugin 'vimwiki/vimwiki'

call vundle#end()            " required
filetype plugin indent on    " required

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
set guioptions-=T
set nohlsearch
set spelllang=en
set autoindent

au BufNewFile,BufRead *.sdf set filetype=xml

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

" UltiSnips config
let g:UltiSnipsListSnippets="<c-l>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"

let g:livepreview_cursorhold_recompile=0

filetype off
set runtimepath+=~/lilypond/usr/share/lilypond/current/vim/
filetype on
