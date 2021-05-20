""" Vim-plug
call plug#begin('~/.vim/plugged')

" Aesthetics - Main
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" Color Themes
Plug 'morhetz/gruvbox'
Plug 'junegunn/limelight.vim'

" Functionalities
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar' 
Plug 'scrooloose/nerdtree'  " file explorer
Plug 'scrooloose/nerdcommenter' " comments
Plug 'sheerun/vim-polyglot'
Plug 'yggdroot/indentline'
Plug 'ctrlpvim/ctrlp.vim'  " fuzzy find files
Plug 'christoomey/vim-tmux-navigator'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " markdown preview

" Git
Plug 'tpope/vim-fugitive'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'

" Start Screen
Plug 'mhinz/vim-startify'

call plug#end()

""" Python3 VirtualEnv
let g:python3_host_prog='/usr/local/bin/python3'

colorscheme gruvbox

" TODO: execute java code, markdown editing config, coc.nvim

""" Other Configurations
filetype plugin indent on 
syntax on    " enable syntax highlighting
set noswapfile 
"set nowrap
set backspace=indent,eol,start
set tabstop=4  "how many space to display a tab
set softtabstop=4  
set shiftwidth=4 "how many space for every level of indentation
set expandtab "convert tab to space
set smarttab 
set autoindent "preserve indentation
set incsearch "enable incremental search
set ignorecase "case insensitive search by default 
set smartcase "case sensitive search when using uppercase letters 
set hlsearch "highlight all search patterns
" set ruler laststatus=2 showcmd showmode
set wrap breakindent
set encoding=UTF-8      "encoding format
set number relativenumber "enable line numbers and relativenumber
set scrolloff=7
"set title 
"set mouse=a "enable mouse support


""" Plugin configs

" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable = '↠' 
let g:NERDTreeDirArrowCollapsible = '↡'
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeGitStatusUseNerdFonts = 1 
let g:NERDTreeIgnore = ['\.pyc$', '\.o$', '\.lib$', '\.a$', '\.dll$', '\.so$', '\.so\.', '\.dylib$', '\.exe$', '\.out$', '\.app$', '\.stackdump$']


" Deoplete
let g:deoplete#enable_at_startup = 1
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Airline
let g:airline_theme='gruvbox'

" indentLine
let g:indentLine_char = '▏'

" TagBar
let g:tagbar_width = 30
let g:tagbar_iconchars = ['↠', '↡']

" Tabs
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <C-Tab> :bn<CR>
nmap <C-S-Tab> :bp<CR>
nmap <C-w> :bd<CR>

" nerdcommenter
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

let g:python_highlight_space_errors = 0 " avoid whitespace highlight 
let g:webdevicons_enable_startify = 1
let g:startify_custom_header = [
\ '   __     _              __     ___             ',
\ '  |  \   | |  ___    __  \ \   / (⌾)_ __ ___    ',
\ '  | | \  | | / __\  /  \  \ \ / /| | ''_ ` _ \  ',
\ '  | |\ \ | |/ /__  | () |  \ V / | | | | | | |  ',
\ '  |_| \_\|_|\____|  \__/    \_/  |_|_| |_| |_|  ',
\ '',
\ '',
\ ]


""" Custom Mappings

let mapleader=","
nmap <leader>q :NERDTreeToggle<CR>
nmap \ <leader>q
nmap <leader>w :TagbarToggle<CR>

" Code Execution - (leader + r)
augroup exe_cute 
    autocmd!
    " execute python code
    autocmd FileType python nnoremap <buffer> <localleader>r
        \   :sp<CR> :term python3 %<CR> :startinsert<CR> 

augroup END

