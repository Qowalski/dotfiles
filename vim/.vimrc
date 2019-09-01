"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
" (_)_/ |_|_| |_| |_|_|  \___|
"

" Plugins {{{

call plug#begin('~/.vim/plugs')
Plug 'tpope/vim-surround'
Plug 'ublevable/quick-scope'
call plug#end()

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" }}}

" Colors {{{

" global
colorscheme gruvbox
" colorscheme PaperColor
set background=dark
syntax enable 

" background
hi Normal ctermbg=NONE
" hi Terminal ctermfg=7

" cursorline
hi LineNr cterm=italic ctermbg=NONE ctermfg=7
hi CursorLine ctermbg=233
hi CursorLineNr cterm=bold ctermbg=232

" comments
hi Comment ctermfg=245

" vertical split
hi VertSplit ctermbg=232 ctermfg=7

" statusline
hi StatusLine ctermbg=232 ctermfg=7

" }}}

" Highlighting {{{

set cursorline
set hlsearch
set nu rnu

" }}}

" Functional {{{

set showcmd
set wildmenu
set lazyredraw
" set noshowmode
set showmode

" set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

set smartindent
"filetype plugin indent on

set splitbelow splitright
set showmatch
set incsearch

" }}}

" Statusline {{{

" enable
set laststatus=2
set statusline=

set statusline+=%1*\ %*             " initial space

" set statusline+=%1*[%n]\ %*       " buffer number
set statusline+=%1*%<%F\ %*         " full path
" set statusline+=%1*[%{&ff}]\ %*   " file format
set statusline+=%1*%y\ %*           " file type
set statusline+=%2*%m%r%*           " modified / read-only flag

set statusline+=%1*%=%*             " start to align right

set statusline+=%1*[%v\ \|\ %*      " column
set statusline+=%1*%l/%L]\ %*       " line numbers

" }}}

autocmd VimEnter * silent exec "! echo -ne '\e[2 q'"
let &t_EI = "\<Esc>[2 q"
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"

" vim:foldmethod=marker
