
source $VIMRUNTIME/vimrc_example.vim

set nobackup

set textwidth=80
set expandtab
set tabstop=4
set shiftwidth=4
set guioptions-=T
set nohlsearch

map gc :s/\(^\s*\)\zs/ <Left>
map gC :s/\(^\s*\)\zs\(\)\=/ <Left><Left><Left><Left><Left><Left>

"mouse"
set ttymouse=xterm2
