
set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here') 

" " let Vundle manage Vundle, required
Plugin 'Valloric/MatchTagAlways'
Plugin 'gmarik/vundle'
"
" " The following are examples of different formats supported.
" " Keep bundle commands between here and filetype plugin indent on.
" " scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails.git'
Plugin 'kana/vim-fakeclip'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
" " scripts not on GitHub
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jwhitley/vim-matchit'
Plugin 'rking/ag.vim'
" " git repos on your local machine (i.e. when working on your own plugin)
" " ...
"GO syntax highlighting
Plugin 'fatih/vim-go'

"Plugin for html5
Plugin 'othree/html5.vim'

"Adding AG
let g:ackprg = 'ag --nogroup --nocolor --column'

call vundle#end()             " required
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


" PATHOGEN START
execute pathogen#infect()
syntax on
filetype plugin indent on
" PATHOGEN END




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

map <F6> : !javac % && !java %:r<Return>

map <Leader>n <plug>NERDTreeTabsToggle<CR>
let NERDTreeShowHidden=1


"set or unset clipboard on deletes with ctrl a
let g:clipboard_set = 0
function! ToggleClipboardOnDeletes()
    if g:clipboard_set
        unmap p
        unmap d
        unmap D
        echom "clipboard on delete set"
        let g:clipboard_set = 0
    else
        xnoremap p "_dP
        nnoremap d "_d
        vnoremap d "_d
        nnoremap D "_D
        vnoremap D "_D
        echom "clipboard on delete unset"
        let g:clipboard_set = 1
    endif
endfunction

map <c-a> :call ToggleClipboardOnDeletes()<cr>


"jsBeautify with ctrl z
map <c-z> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-z> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-z> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-z> :call CSSBeautify()<cr>
