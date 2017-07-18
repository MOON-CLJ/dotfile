set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'klen/python-mode'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
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

vnoremap // y/<C-R>"<CR>

let g:pymode_lint_ignore = "E501,E126"

nnoremap <leader>jdf :YcmCompleter GoToDefinition
nnoremap <leader>jdc :YcmCompleter GoToDeclaration
