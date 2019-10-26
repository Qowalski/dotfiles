"       _
"  __ _(_)_ __  _ _ __
"  \ V / | '  \| '_/ _|
" (_)_/|_|_|_|_|_| \__|
"

"" Plugins |{{{

    call plug#begin('~/.vim/plugs')
        Plug 'tpope/vim-surround'
        Plug 'unblevable/quick-scope'
        Plug 'scrooloose/nerdtree'
        " Plug 'junegunn/goyo.vim'
        Plug 'mboughaba/i3config.vim'
        Plug 'tpope/vim-commentary'
        " Plug 'valloric/youcompleteme'
        Plug 'tmhedberg/SimpylFold'
        Plug 'skywind3000/asyncrun.vim'
        Plug 'tpope/vim-repeat'
        Plug 'vim-python/python-syntax'

        " Colorschemes
        Plug 'morhetz/gruvbox'
        Plug 'fxn/vim-monochrome'
        Plug 'rj-white/vim-colors-paramountblue'
        Plug 'hauleth/blame.vim'
        Plug 'baskerville/bubblegum'
    call plug#end()

    " python-syntax
    let g:python_highlight_all = 1

    " quick-scope
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

    " nerdtree
    map <C-n> :NERDTreeToggle<CR>

    " vimtex
    let g:vimtex_view_general_viewer = 'zathura'
    autocmd BufwritePre *.tex VimtexCompile

    "" goyo |{{{
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


    "" }}}


"" }}}
"" Keymapping |{{{

    " Split navigation
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

    " create a pdf file with pandoc
    nnoremap <C-m> :![[ % == *.md ]] && pandoc -s % -o $(echo % \| awk -F . '{ print $1 }').pdf<CR>

    " open subshell
    nnoremap <C-s> :sh<CR>

    " default
    nnoremap Y y$
    nnoremap U <C-r>
    nnoremap S hs

"" }}}
"" Functional |{{{

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
    set foldmethod=marker
    filetype plugin indent on

    " Disbale automatic commenting on new line
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " Delete all trailing whitespace when saved
    autocmd BufwritePre * %s/\s\+$//e

    " autocmd BufwritePost *.tex term ++close ++hidden pdflatex %


"" }}}
"" Coloring |{{{
    "" gruvbox
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

    " italic for tmux
    set t_ZH=[3m
    set t_ZR=[m


    "" terminal colors
    " let g:terminal_ansi_colors = [
    "   \ "#282828", "#cc241d", "#98971a", "#d79921",
    "   \ "#458588", "#b16286", "#689d6a", "#a89984",
    "   \ "#928374", "#fb4934", "#b8bb26", "#fabd2f",
    "   \ "#83a598", "#d4869b", "#8ec07c", "#ebdbb2"
    "   \]

    set background=dark

    function! SetColors()
        hi normal guibg=NONE
        " hi CursorLine guibg=#282828
        hi CursorLine guibg=#080808
        hi LineNr cterm=italic
        hi CursorLineNr cterm=bold,italic guibg=#080808
        hi VertSplit guifg=#3c3836 guibg=#3c3836
        hi statuslineNC guifg=#1d2021 guibg=#3c3836
        hi QuickScopePrimary cterm=bold,italic guifg=#fb4934
        hi QuickScopeSecondary cterm=bold,italic guifg=#cc241d
    endfunction

    function! SetHighlights()
        set cursorline
        set hlsearch
        set number relativenumber
    endfunction


    autocmd BufreadPre *.py match ErrorMsg '\%>79v.\+'

    silent call SetColors()
    silent call SetHighlights()

"" }}}
"" Statusline |{{{

"" Mode Map |{{{

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


"" }}}
    function! SetStatusline()
    "     " red
    "     hi User1 cterm=bold guifg=#fb4934 guibg=#3c3836
    "     " green
    "     hi User2 cterm=bold guifg=#b8bb26 guibg=#3c3836
    "     " yellow
    "     hi User3 cterm=bold guifg=#fabd2f guibg=#3c3836
    "     " blue
    "     hi User4 cterm=bold guifg=#83a598 guibg=#3c3836
    "     " purple
    "     hi User5 cterm=bold guifg=#d3869b guibg=#3c3836
    "     " cyan
    "     hi User6 cterm=bold guifg=#8ec07c guibg=#3c3836
    "     " orange
    "     hi User7 cterm=bold guifg=#fe8019 guibg=#3c3836
    "     " black
          " hi User8 cterm=bold guifg=#1d2021 guibg=#3c3836
        hi User1 cterm=italic guifg=#a89984 guibg=NONE
        hi User2 cterm=italic guifg=#fb4934 guibg=NONE

        " Statusline
        set laststatus=2
        set statusline=%2*\ %R%W\ %1*%F%=%v
    "     set statusline=%8*\ %*                          " space
    "     set statusline+=%8*%-9{g:modeMap[mode()]}\ %*   " mode
    "     set statusline+=%8*/\ %*                        " separator
    "     set statusline+=%3*B%n\ %*                      " buffer
    "     set statusline+=%8*→\ %*                        " separator
    "     set statusline+=%7*%.50F\ %*                    " file
    "     set statusline+=%2*%M%*                         " modified flag
    "     set statusline+=%1*%R%*                         " readonly flag
    "     set statusline+=%3*%W%*                         " preview flag
    "     set statusline+=%2*%H\ %*                       " help flag
    "     set statusline+=%8*%=%*                         " <-- -->
    "     set statusline+=%3*%Y\ %*                       " filetype
    "     set statusline+=%8*/\ %*                        " separator
    "     set statusline+=%4*⇆\ %8*%-2v\ %*               " column
    "     set statusline+=%6*⇅\ %8*%L\ %*                 " lines
    "     set statusline+=%8*/\ %*                        " separator
    "     set statusline+=%8*%{strftime('%H:%M')}\ %*     " time
    endfunction

    silent call SetStatusline()


"" }}}
"" Cursorstyle |{{{
    function! SetCursor()
        if exists('$TMUX')
            let &t_EI = "\ePtmux;\e\e[2 q\e\\"
            let &t_SI = "\ePtmux;\e\e[6 q\e\\"
            let &t_SR = "\ePtmux;\e\e[4 q\e\\"
            silent exec "!printf '\ePtmux;\e\e[2 q\e\\'"
        else
            let &t_EI = "\e[2 q"
            let &t_SI = "\e[6 q"
            let &t_SR = "\e[4 q"
            silent exec "!printf '\e[2 q'"
        endif
    endfunction

    autocmd ShellCmdPost * silent call SetCursor()
    autocmd VimEnter * silent call SetCursor()


"" }}}
