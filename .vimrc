set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive' " git integration
Plugin 'itchyny/lightline.vim'

    " Configure lightline plugin
    let g:lightline = {
                \ 'active': {
                \   'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]
                \ },
                \ 'component_function': {
                \   'gitbranch': 'LightLineGitBranchName'
                \ },
                \ }

    function! LightLineGitBranchName()
        " add this cool symbol before git branch name
        return exists('*fugitive#head') ? ' ' . fugitive#head() : ''
    endfunction


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" enable syntax higlighting
syntax on

" always display status line
set laststatus=2

" disable -- INSERT --, -- VISUAL LINE -- indicators since lightline already
" displays them 
set noshowmode

" turn on line numbers
set nu

" turn on relative line numbers for lines other than current cursor line
set relativenumber

" tab settings
set tabstop=4		" width that a <TAB> character displays as
set expandtab		" convert <TAB> key-presses to spaces
set shiftwidth=4	" number of spaces to use for each step of (auto) indent
set softtabstop=4	" backspace after pressing <TAB> will remove up to this many spaces

set autoindent		" copy indent from current line when starting a new line
set smartindent		" smart autoindent (e.g. add indent after '{')
