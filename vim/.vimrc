"       _
"  __ _(_)_ __  _ _ __
"  \ V / | '  \| '_/ _|
" (_)_/|_|_|_|_|_| \__|
"


"" -- plugins     |{{{

    "" - plug        |{{{

        call plug#begin('~/.vim/plugs')
            " essential
            Plug 'tpope/vim-commentary'
            Plug 'tpope/vim-surround'
            Plug 'tpope/vim-repeat'
            Plug 'unblevable/quick-scope'
            Plug 'tmhedberg/SimpylFold'

            " filebrowser
            Plug 'scrooloose/nerdtree'

            " syntax
            Plug 'mboughaba/i3config.vim'
            Plug 'calviken/vim-gdscript3'

            " colorschemes
            Plug 'morhetz/gruvbox'
            Plug 'fxn/vim-monochrome'
            Plug 'rj-white/vim-colors-paramountblue'
            Plug 'hauleth/blame.vim'
        call plug#end()


    "" - plug        |}}}
    "" - gruvbox     |{{{

        let g:gruvbox_contrast_light = 'soft'
        let g:gruvbox_contrast_dark = 'hard'
        let g:gruvbox_bold = 1
        let g:gruvbox_italic = 1
        let g:gruvbox_underline = 1
        let g:gruvbox_undercurl = 1
        let g:gruvbox_imporoved_strings = 1


    "" - gruvbox     |}}}
    "" - quick-scope |{{{

        hi QuickScopePrimary cterm=bold,italic guifg=#fb4934
        hi QuickScopeSecondary cterm=bold,italic guifg=#cc241d
        let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


    "" - quick-scope |}}}
    "" - nerdtree
        map <C-n> :NERDTreeToggle<CR>

    "" - monochrome
        let g:monochrome_italic_comments = 1


"" -- plugins     |}}}
"" -- functional  |{{{

    "" - defaults |{{{
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
        set cursorline
        set hlsearch
        set number relativenumber
        set noswapfile
        filetype plugin indent on


    "" - defaults |}}}
    "" - specials |{{{

        " disbale automatic commenting on new line
        autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

        " delete all trailing whitespace when saved
        autocmd BufwritePre * %s/\s\+$//e

        " enable backspace in insert mode
        set backspace=indent,eol,start

        " red backgound at n line length
        match ErrorMsg '\%>88v.\+'


    "" - specials |}}}


"" -- functional  |}}}
"" -- keymapping  |{{{

    " - defaults
        nnoremap Y y$
        nnoremap U <C-r>
        nnoremap S hs

    " - subshell
        nnoremap <C-s> :sh<CR>

    " - hilighting
        nnoremap <C-h> :nohlsearch<CR>


"" -- keymapping  |}}}
"" -- coloring    |{{{

    "" - general     |{{{

        " enable 24-bit colors
        set t_8f=[38;2;%lu;%lu;%lum
        set t_8b=[48;2;%lu;%lu;%lum
        set termguicolors

        " tmux
        set t_ZH=[3m
        set t_ZR=[m


    "" - general     |}}}
    "" - terminal    |{{{

        let g:terminal_ansi_colors = [
          \ "#282828", "#cc241d", "#98971a", "#d79921",
          \ "#458588", "#b16286", "#689d6a", "#a89984",
          \ "#928374", "#fb4934", "#b8bb26", "#fabd2f",
          \ "#83a598", "#d4869b", "#8ec07c", "#ebdbb2"
          \]


    "" - terminal    |}}}
    "" - colorscheme |{{{

        colorscheme monochrome
        " colorscheme gruvbox
        set background=dark

        hi normal guibg=NONE
        hi CursorLine guibg=#080808

        if g:colors_name == "gruvbox"
            hi User1 cterm=italic guifg=#a89984 guibg=NONE
            hi User2 cterm=italic guifg=#fb4934 guibg=NONE

            hi LineNr       cterm=italic
            hi CursorLineNr cterm=bold,italic                   guibg=#080808
            hi VertSplit                        guifg=#3c3836   guibg=#3c3836
            hi statuslineNC                     guifg=#1d2021   guibg=#3c3836
            hi Folded       cterm=italic                        guibg=#101010

        elseif g:colors_name == "monochrome"
            hi User1        cterm=italic        guifg=#737373   guibg=NONE
            hi User2        cterm=italic        guifg=#b6403a   guibg=NONE

            hi Folded       cterm=italic                        guibg=#181818
        endif

    "" - colorcheme |}}}


"" -- coloring    |}}}
"" -- statusline  |{{{

    set laststatus=2
    set statusline=%2*\ %R%W\ %1*%F%=%v


"" -- statusline  |}}}
"" -- cursorstyle |{{{


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

    autocmd ShellCmdPost    * silent call SetCursor()
    autocmd VimEnter        * silent call SetCursor()


"" cursorstyle |}}}
