" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

set background=light
colorscheme solarized

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

set nowrap
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set list listchars=tab:▸-,trail:·,extends:❯,precedes:❮

set autoindent
set smartindent
set showmatch
set incsearch
set hlsearch

" C/C++
autocmd FileType c setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType cpp setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
let c_no_curly_error=1
