set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Valloric/YouCompleteMe'
call vundle#end()


" Pathogen load
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

let g:pymode_lint_ignore = "E501,E126"

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/venv/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

nnoremap <leader>jdf :YcmCompleter GoToDefinition
nnoremap <leader>jdc :YcmCompleter GoToDeclaration
