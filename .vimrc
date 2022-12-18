set mouse-=a
set backup
set backupdir=~/.vim/tmp//,.
set directory=~/.vim/tmp//,.
set nocompatible
set number
filetype on
filetype plugin on
filetype indent on
set autoindent
set tabstop=2
set shiftwidth=2
set et
highlight LineNr ctermfg=grey
syntax on
nnoremap <C-e> <C-w>
set pastetoggle=<F2>
nmap <F3> :set invnumber<CR>

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
call plug#end()
color palenight

