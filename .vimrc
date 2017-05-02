set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let mapleader=","       " change leader to comma

"plugin manager
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive' "git plugin
Plugin 'scrooloose/nerdtree' "file free
Plugin 'ctrlpvim/ctrlp.vim' "fuzzy search for files
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

Plugin 'terryma/vim-multiple-cursors' "mult-cursors like in sublime

Plugin 'vim-airline/vim-airline' "status line at bottom
Plugin 'vim-airline/vim-airline-themes' "themes for status line
let g:airline#extensions#tabline#enabled = 1 "enable smart tab for airline

Plugin 'vim-syntastic/syntastic' "syntax checking
Plugin 'honza/vim-snippets' "tons of useful snippets

Plugin 'valloric/youcompleteme' "autocomplete, needs external ycm

Plugin 'SirVer/ultisnips' "snippet framework
"needed to remap ultisnips keys to play well with youcompleteme
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"



call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"look into surround.vim, nerd commenter, tagbar, gundo.vim



colorscheme delek "backup default colorscheme
try "try my favorite colorscheme if it is installed
colorscheme molokai
catch
endtry

set visualbell "no sounds
syntax enable 
set autoread "make vim see changes made to file from outside vim
set number "set line numbers
set encoding=utf-8
"set noswapfile
"set nobackup
"set nowb

set laststatus=2 "keep statusbar shown
set incsearch  " Find the next match as we type the search
set hlsearch   " Highlight searches by default
"set key for unhighlighting search results
nnoremap <leader><space> :nohlsearch<CR> 
set ignorecase " Ignore case when searching...
set smartcase  " ...unless we type a capital

set tabstop=4  " make tabs 4 spaces
set softtabstop=4 "tab needs to also be 4 when editing
set autoindent
set smartindent
set smarttab

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

set lazyredraw "makes vim not redraw screen during macros and others

" move vertically by visual line for code that is wrapped
nnoremap j gj
nnoremap k gk


"change where vim writes backups, dont want in cwd
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup




if has('mouse')
	set mouse=a
endif






