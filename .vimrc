
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
Plugin 'tpope/vim-rails.git'
Plugin 'kana/vim-fakeclip'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" " scripts not on GitHub
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
set relativenumber 
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
set laststatus=2

" Quick ESC
imap jj <ESC>

" changing tabs
map <F8> :tabn<CR>
map <F7> :tabp<CR>

" changing buffers
nmap <BS> :bnext<CR>
nmap = :bprev<CR>


"compiling
map <F2> : !gcc % && ./a.out <CR>
map <F3> : !gcc % && ./a.out \| less <CR>
map <F4> : !clang++ -stdlib=libc++ -std=gnu++11 % && ./a.out <CR>
map <F5> : !clang++ -stdlib=libc++ -std=gnu++11 % && ./a.out \| less <CR>

map <F6> : !javac % && !java %:r<Return>


"nerd tree
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

"ctrlp settings
set wildignore+=*.a,*.o,*.class
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_STORE,.git,.hg,.svn
set wildignore+=*/node_modules/*
set wildignore+=*/target/*,*/build/*,*/coverage/*
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_max_files=0
let g:ctrlp_follow_symlinks=1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_depth=40

" airline settings
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1

"diable arow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"map window change
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

"easy motion
nmap s <Plug>(easymotion-overwin-f)

nmap L <Plug>(easymotion-lineforward)
nmap J <Plug>(easymotion-j)
nmap K <Plug>(easymotion-k)
nmap H <Plug>(easymotion-linebackward)

"set undo
set undofile
set undodir=~/.vim/undo

"syntastic
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        Errors
    endif
endfunction

nnoremap <silent> <Leader>e :<c-u>call ToggleErrors()<CR>
nnoremap <silent> <Leader>t :SyntasticToggleMode<CR>
nnoremap <silent> <c-]> :lnext<CR>
nnoremap <silent> <c-[> :lprevious<CR>zz

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['javascript'], 'passive_filetypes': ['html'] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5
