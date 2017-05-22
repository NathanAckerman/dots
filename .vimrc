set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let mapleader=","       " change leader to comma

"plugin manager
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround' "surround things with parense or braces etc
Plugin 'tpope/vim-repeat' "lets you repeat more complex plugin maps
Plugin 'tpope/vim-fugitive' "git plugin
Plugin 'scrooloose/nerdtree' "file free
Plugin 'scrooloose/nerdcommenter' "functions for commenting

Plugin 'easymotion/vim-easymotion' "move to things faster
"map <Leader> <Plug>(easymotion-prefix)

Plugin 'ctrlpvim/ctrlp.vim' "fuzzy search for files
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0 "make ctrl-p open files in new tab
let g:ctrlp_working_path_mode = 0

Plugin 'terryma/vim-multiple-cursors' "mult-cursors like in sublime

Plugin 'vim-airline/vim-airline' "status line at bottom
Plugin 'vim-airline/vim-airline-themes' "themes for status line
let g:airline#extensions#tabline#enabled = 1 "enable smart tab for airline
let g:airline#extensions#tabline#fnamemod = ':t' "show only the filename
"let g:airline_theme='base16'
"Plugin 'bling/vim-bufferline' "dont need because of upper line

Plugin 'vim-syntastic/syntastic' "syntax checking

Plugin 'honza/vim-snippets' "tons of useful snippets for ultisnips(and snipmate)

Plugin 'valloric/youcompleteme' "autocomplete, needs external ycm installed

Plugin 'valloric/vim-operator-highlight' "highlight + - / < etc
"let g:ophigh_color = 111 "for unikitty theme
let g:ophigh_color = 197 "for molokai theme
"let g:ophigh_color_gui = "#F6FF00"

Plugin 'SirVer/ultisnips' "snippet framework
"needed to remap ultisnips keys to play well with youcompleteme
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"colorschemes for vim
Plugin 'chriskempson/base16-vim'
let base16colorspace=256  " Access colors present in 256 colorspace

Plugin 'majutsushi/tagbar' "see the ctags for a file --needs ctags already installed via apt-get

Plugin 'chrisbra/Colorizer' "highlight hex color codes in their color
"these arent working todo
"nnoremap <C-S-C> :ColorHighlight<CR>
"nnoremap <C-S-U> :ColorClear<CR>

Plugin 'abudden/taghighlight-automirror'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"key remappings
"remap : to ; for easier use
nnoremap ; :
"open .vimrc for editing with ,ev
nnoremap <leader>ev :split $MYVIMRC<cr>
"resource the .vimrc while in vim
nnoremap <leader>sv :source $MYVIMRC<cr>
"make NERDTree easier to use with F7
nnoremap <F7> :NERDTreeToggle<CR>
"set key for unhighlighting search results
nnoremap <leader><space> :nohlsearch<CR>
"set ctrl-D to delete current line in insert mode would overwrite un-indent
"inoremap <c-d> <esc>ddi
"put parentheses around current word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
"remap H key hardly used to first nonblank char in line
nnoremap H ^
"remap L key hardly used to last nonblank char in line
nnoremap L $
"remap ctrl-c in visual mode to copy text (also to clipboard)
vnoremap <C-c> "+y
"move to the next buffer
nnoremap <leader>l :bnext<CR>
"move to the previous buffer
nnoremap <leader>h :bprevious<CR>
"easier tagbar viewing
nnoremap <leader>t :TagbarToggle<CR>
" move vertically by visual line for code that is wrapped
nnoremap j gj
nnoremap k gk
"update the class files from the ctags for syntax highlighting
nnoremap <c-@> :UpdateTypesFile<CR>
"remap ctrl-s to save instead of lock needs the following commands in .bashrc
"bind -r '\C-s'
"stty -ixon
nnoremap <c-s> :update<CR>
inoremap <c-s> <ESC>:update<CR>a



"funciton to remove trailing whitespace from entire file
fun! TrimWhitespace()
	let l:save = winsaveview()
	%s/\s\+$//e
	call winrestview(l:save)
endfun
nnoremap <leader>W :call TrimWhitespace()<CR>

"show the syntax group of word under cursor
nnoremap <C-b> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"needed to make java highlight methods
let java_highlight_functions = 1



colorscheme delek "backup default colorscheme
try "try my favorite colorscheme if it is installed
"colorscheme base16-unikitty-dark
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
catch
endtry

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
set clipboard=unnamedplus "needed for copying to system clipboard
set visualbell "no sounds
syntax enable
set autoread "make vim see changes made to file from outside vim
set number "set line numbers
"set encoding=utf-8
set backspace=indent,eol,start "make backspace work like it should
set laststatus=2 "keep statusbar shown
set incsearch  " Find the next match as we type the search
set hlsearch   " Highlight searches by default
set ignorecase " Ignore case when searching...
set smartcase  " ...unless we type a capital

set scrolloff=8         "Start scrolling when it's 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
"set colorcolumn=81 "make 81st column diff color
"call matchadd('ColorColumn', '\%81v', 100) "only do offending collumns

set lazyredraw "makes vim not redraw screen during macros and others

"change where vim writes backups, dont want in cwd
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

set tabstop=4  " make tabs 4 spaces
set softtabstop=4 "tab needs to also be 4 when editing
set autoindent
set smartindent
set smarttab
set shiftwidth=4


if has('mouse')
	set mouse=a
endif






