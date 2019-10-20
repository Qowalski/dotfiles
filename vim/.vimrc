"       _
"  __ _(_)_ __  _ _ __
"  \ V / | '  \| '_/ _|
" (_)_/|_|_|_|_|_| \__|
"

" Plugins {{{

    call plug#begin('~/.vim/plugs')
        Plug 'tpope/vim-surround'
        Plug 'unblevable/quick-scope'
        Plug 'scrooloose/nerdtree'
        Plug 'morhetz/gruvbox'
        Plug 'junegunn/goyo.vim'
        Plug 'mboughaba/i3config.vim'
        Plug 'tpope/vim-commentary'
        Plug 'valloric/youcompleteme'
    call plug#end()

    " quick-scope
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

    " Nerdtree
    map <C-n> :NERDTreeToggle<CR>

    " goyo {{{
    map <C-g> :Goyo <CR>

    let g:goyo_linenr = 1
    let g:goyo_height = "100%"
    let g:goyo_width = 100

    function! s:goyo_enter()
        silent call SetHighlights()
        silent call SetStatusline()

        let b:quitting = 0
        let b:quitting_bang = 0
        autocmd QuitPre <buffer> let b:quitting = 1
        cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
    endfunction

    function! s:goyo_leave()
        silent call SetColors()
        silent call SetHighlights()
        silent call SetStatusline()
        if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
            if b:quitting_bang
                qa!
            else
                qa
            endif
        endif
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
    " }}}

" }}}

" Keymapping {{{

    " Split navigation
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" }}}

" Functional {{{

    set noshowcmd
    set wildmenu
    set lazyredraw
    set noshowmode
    set expandtab
    set shiftwidth=4
    set softtabstop=4
    set splitbelow splitright
    set showmatch
    set incsearch
    filetype plugin indent on

    " Disbale automatic commenting on new line
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " Delete all trailing whitespace when saved
    autocmd BufwritePre * %s/\s\+$//e

" }}}

" Coloring {{{


    " gruvbox
    let g:gruvbox_contrast_light = 'soft'
    let g:gruvbox_contrast_dark = 'hard'
    let g:gruvbox_bold = 1
    let g:gruvbox_italic = 1
    let g:gruvbox_underline = 1
    let g:gruvbox_undercurl = 1
    let g:gruvbox_imporoved_strings = 1
    colorscheme gruvbox

    " 24-bit colors
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
    set termguicolors

    set background=dark

    function! SetColors()
        hi CursorLine guibg=#282828
        hi LineNr cterm=italic
        hi CursorLineNr cterm=bold,italic guibg=#282828
        hi VertSplit guifg=#3c3836 guibg=#3c3836
        hi statuslineNC guifg=#1d2021 guibg=#3c3836
        hi QuickScopePrimary cterm=bold,italic guifg=#fb4934
        hi QuickScopeSecondary cterm=bold,italic guifg=#cc241d
    endfunction

    function! SetHighlights()
        set cursorline
        set hlsearch
        set number relativenumber
        match ErrorMsg '\%>80v.\+'
    endfunction

    silent call SetColors()
    silent call SetHighlights()

" }}}

" Statusline {{{

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

    function! SetStatusline()
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

        " Statusline
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
        set statusline+=%2*%H\ %*                       " help flag
        set statusline+=%8*%=%*                         " <-- -->
        set statusline+=%3*%Y\ %*                       " filetype
        set statusline+=%8*/\ %*                        " separator
        set statusline+=%4*⇆\ %8*%-2v\ %*               " column
        set statusline+=%6*⇅\ %8*%L\ %*                 " lines
        set statusline+=%8*/\ %*                        " separator
        set statusline+=%8*%{strftime('%H:%M')}\ %*     " time
    endfunction

    silent call SetStatusline()

" }}}

" Cursorstyle {{{

    autocmd VimEnter * silent exec "! echo -ne '\e[2 q'"
    autocmd ShellCmdPost * silent exec "! echo -ne '\e[2 q'"
    let &t_EI = "\<Esc>[2 q"
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"

" }}}

" vim:foldmethod=marker
