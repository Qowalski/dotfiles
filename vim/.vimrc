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

" Functional {{{

" set showcmd
set wildmenu
set lazyredraw
set noshowmode

" set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

"set smartindent
filetype plugin indent on

set splitbelow splitright

set showmatch
set incsearch

" }}}

" Highlighting {{{

set cursorline
set hlsearch
set number relativenumber
match ErrorMsg '\%>80v.\+'

" }}}

" Colors {{{

" 24-bit colors
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
set termguicolors

" gruvbox
set background=dark
let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1
let g:gruvbox_imporoved_strings = 1
colorscheme gruvbox

hi CursorLine guibg=#282828

hi LineNr cterm=italic
hi CursorLineNr cterm=bold,italic guibg=#282828

hi VertSplit guifg=#3c3836 guibg=#3c3836

hi statuslineNC guifg=#1d2021 guibg=#3c3836

" }}}

" Statusline {{{

" Colors {{{

" red
hi User1 cterm=bold guifg=#fb4934 guibg=#3c3836
" green
hi User2 cterm=bold guifg=#b8bb26 guibg=#3c3836
" yellow
hi User3 cterm=bold guifg=#fabd2f guibg=#3c3836
" blue
hi User4 cterm=bold guifg=#83a598 guibg=#3c3836
" purple
hi User5 cterm=bold guifg=#d3869b guibg=#3c3836
" cyan
hi User6 cterm=bold guifg=#8ec07c guibg=#3c3836
" orange
hi User7 cterm=bold guifg=#fe8019 guibg=#3c3836
" black
hi User8 cterm=bold guifg=#1d2021 guibg=#3c3836

" }}}

" Mode Map {{{

let g:modeMap = {
    \ 'n'       :   "Normal",
    \ "no"      :   "Pending",
    \ 'v'       :   "Visual",
    \ 'V'       :   "V.Line",
    \ "\<C-V>"  :   "V.Block",
    \ 's'       :   "Select",
    \ 'S'       :   "S.Line",
    \ "\<C-S>"  :   "S.Block",
    \ 'i'       :   "Insert",
    \ 'R'       :   "Replace",
    \ "Rv"      :   "V.Replace",
    \ 'c'       :   "Command",
    \ "cv"      :   "Vim.Ex",
    \ 'r'       :   "Prompt",
    \ "rm"      :   "More",
    \ "r?"      :   "Confirm",
    \ '!'       :   "Shell",
    \ 't'       :   "Terminal"
    \}

" }}}

set laststatus=2

set statusline=%8*\ %*                          " space
set statusline+=%8*%-9{g:modeMap[mode()]}\ %*   " mode
set statusline+=%8*/\ %*                        " separator
set statusline+=%3*B%n\ %*                      " buffer
set statusline+=%8*→\ %*                        " separator
set statusline+=%7*%.50F\ %*                    " file
set statusline+=%2*%M%*                         " modified flag
set statusline+=%1*%R%*                         " readonly flag
set statusline+=%3*%W%*                         " preview flag
set statusline+=%2*%H\ %*                         " help flag
set statusline+=%8*%=%*                         " <-- -->
set statusline+=%3*%Y\ %*                       " filetype
set statusline+=%8*/\ %*                        " separator
set statusline+=%4*⇆\ %8*%-2v\ %*               " column
set statusline+=%6*⇅\ %8*%L\ %*                 " lines

" }}}

" Cursor {{{

autocmd VimEnter * silent exec "! echo -ne '\e[2 q'"
autocmd ShellCmdPost * silent exec "! echo -ne '\e[2 q'"
let &t_EI = "\<Esc>[2 q"
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"

" }}}

" vim:foldmethod=marker
