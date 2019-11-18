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
        return exists('*fugitive#head') ? (' ' . fugitive#head()) : ''
    endfunction

Plugin 'jiangmiao/auto-pairs' " parens created in pairs
Plugin 'scrooloose/nerdtree' " file directory in vim

    " Configure NERDTree plugin
    map <C-N> :NERDTreeToggle<CR> " map toggle NERDTree to Ctrl + n
    let NERDTreeShowHidden=1 " show hidden files by default

Plugin 'tpope/vim-surround' " add 'surround' functionality, to modify a 'surrounding' object
Plugin 'Xuyuanp/nerdtree-git-plugin' " display Git status flags beside files in NERDTree
Plugin 'airblade/vim-gitgutter' " shows git diff symbols in gutter

    " Configure vim-gitguttter plugin
    set updatetime=100  " update diff markers in 100ms
    "let g:gitgutter_override_sign_column_highlight = 0
    "highlight clear SignColumn
    "highlight GitGutterAdd ctermfg=2
    "highlight GitGutterChange ctermfg=3
    "highlight GitGutterDelete ctermfg=1
    "highlight GitGutterChangeDelete ctermfg=4

Plugin 'tpope/vim-commentary' " easy comments


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

" vim theme
set background=dark  " dark background
colorscheme solarized

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

" line length guide configurations
if exists('+colorcolumn')
    set colorcolumn=80
    " change line length guide to grey
    highlight ColorColumn ctermbg=0 guibg=lightgrey
endif

"tab settings
set tabstop=4		" width that a <TAB> character displays as
set expandtab		" convert <TAB> key-presses to spaces
set shiftwidth=4	" number of spaces to use for each step of (auto) indent
set softtabstop=4	" backspace after pressing <TAB> will remove up to this many spaces

set autoindent		" copy indent from current line when starting a new line
set smartindent		" smart autoindent (e.g. add indent after '{')

set encoding=utf-8
set showmatch       " jump to matching braces upon closing (for visual confirmation)
set matchtime=3     " time in tenth of a second to showmatch above

" search settings
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
set ignorecase      " case-insensitive search
set smartcase       " if case is used, only find case-matching

set cursorline      " highlight current line
set autoread        " autoreload file if file was changed outside vim

" leader settings
let mapleader = ","
set showcmd         " display cmd inputs, for visual confirmation of leader cmds

" highlight trailing whitespace
" https://vim.fandom.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" fix backspace for brew vim (not required on macvim)
set backspace=indent,eol,start

" display various whitespace characters
set list
set listchars=
set listchars+=trail:⋅

" bind key to remove highlights ("redraw terminal screen")
" search and replace highlights linger even after completion
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
