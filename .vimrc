
set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" " alternatively, pass a path where Vundle should install bundles
" "let path = '~/some/path/here'
" "call vundle#rc(path)
"
" " let Vundle manage Vundle, required
Bundle 'Valloric/MatchTagAlways'
Bundle 'gmarik/vundle'
"
" " The following are examples of different formats supported.
" " Keep bundle commands between here and filetype plugin indent on.
" " scripts on GitHub repos
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails.git'
Bundle 'kana/vim-fakeclip'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" " scripts from http://vim-scripts.org/vim/scripts.html
Bundle 'L9'
Bundle 'FuzzyFinder'
" " scripts not on GitHub
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'jwhitley/vim-matchit'
Bundle 'rking/ag.vim'
" " git repos on your local machine (i.e. when working on your own plugin)
" " ...

"Adding AG
let g:ackprg = 'ag --nogroup --nocolor --column'

filetype plugin indent on     " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :BundleList          - list configured bundles
" " :BundleInstall(!)    - install (update) bundles
" " :BundleSearch(!) foo - search (or refresh cache first) for foo
" " :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
" "
" " see :h vundle for more details or wiki for FAQ
" " NOTE: comments after Bundle commands are not allowed.
" " Put your stuff after this line


colorscheme jellybeans
set hlsearch
hi Search cterm=NONE ctermbg=Yellow ctermfg=Black
set t_Co=256
set expandtab
set shiftwidth=4
set encoding=utf-8
set tabstop=4
set wrap
set number
set nowritebackup
set noswapfile
set nobackup
set smartcase
set smarttab
set softtabstop=4
set linebreak
setlocal linebreak
set clipboard=unnamed
set backspace=indent,eol,start

" Quick ESC
imap jj <ESC>

" quicker movements by 10 steps
nmap `j 10j
nmap `k 10k
nmap `l 10l
nmap `h 10h


map <F8> :tabn<CR>
map <F7> :tabp<CR>
" format the entire file
nmap <leader>fef ggVG=

map <F2> : !gcc % && ./a.out <CR>
map <F3> : !gcc % && ./a.out \| less <CR>
map <F4> : !clang++ -stdlib=libc++ -std=gnu++11 % && ./a.out <CR>
map <F5> : !clang++ -stdlib=libc++ -std=gnu++11 % && ./a.out \| less <CR>

map <F6> :!java %:r<Return>

map <Leader>n <plug>NERDTreeTabsToggle<CR>

