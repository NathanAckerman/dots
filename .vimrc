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
let g:ctrlp_switch_buffer = 0 "make ctrl-p open files in new tab
let g:ctrlp_working_path_mode = 0

Plugin 'terryma/vim-multiple-cursors' "mult-cursors like in sublime

Plugin 'vim-airline/vim-airline' "status line at bottom
Plugin 'vim-airline/vim-airline-themes' "themes for status line
let g:airline#extensions#tabline#enabled = 1 "enable smart tab for airline

Plugin 'vim-syntastic/syntastic' "syntax checking
Plugin 'honza/vim-snippets' "tons of useful snippets for ultisnips(and snipmate)

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

"key remappings
"open .vimrc for editing with ,ev
nnoremap <leader>ev :split $MYVIMRC<cr>
"resource the .vimrc while in vim
nnoremap <leader>sv :source $MYVIMRC<cr>
"make NERDTree easier to use with F7
nnoremap <F7> :NERDTreeToggle<CR>
"set key for unhighlighting search results
nnoremap <leader><space> :nohlsearch<CR> 
"set ctrl-D to delete current line in insert mode
inoremap <c-d> <esc>ddi
"put parentheses around current word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
"remap H key hardly used to first nonblank char in line
nnoremap H ^
"remap L key hardly used to last nonblank char in line
nnoremap L $
"remap dw to bdw to go to beginning of word first
nnoremap dw bdw
"remap ctrl-c in visual mode to copy text (also to clipboard)
vnoremap <C-c> "+y


colorscheme delek "backup default colorscheme
try "try my favorite colorscheme if it is installed
colorscheme molokai
catch
endtry

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
set clipboard=unnamed "needed for copying to system clipboard
set visualbell "no sounds
syntax enable 
set autoread "make vim see changes made to file from outside vim
set number "set line numbers
set encoding=utf-8
"set noswapfile
"set nobackup
"set nowb
set backspace=indent,eol,start "make backspace work like it should
set laststatus=2 "keep statusbar shown
set incsearch  " Find the next match as we type the search
set hlsearch   " Highlight searches by default
set ignorecase " Ignore case when searching...
set smartcase  " ...unless we type a capital

set tabstop=4  " make tabs 4 spaces
set softtabstop=4 "tab needs to also be 4 when editing
set autoindent
set smartindent
set smarttab

set scrolloff=8         "Start scrolling when it's 8 lines away from margins
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






