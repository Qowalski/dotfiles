"       _
"  __ _(_)_ __  _ _ __
"  \ V / | '  \| '_/ _|
" (_)_/|_|_|_|_|_| \__|
"

"" -- Plug        |{{{

    let g:PlugFresh = 0

    " check if Plug is installed
    function! IsPlug()
        return !empty(glob('~/.vim/autoload/plug.vim'))
    endfunction

    if !IsPlug()
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        let g:PlugFresh = 1
    endif

    " load plugins
    if IsPlug()
        call plug#begin('~/.vim/plugs')
            " essentials
            Plug 'tpope/vim-commentary'
            Plug 'tpope/vim-surround'
            Plug 'tpope/vim-repeat'
            Plug 'tmhedberg/SimpylFold'
            Plug 'SirVer/ultisnips'
                let g:UltiSnipsEditSplit="vertical"
            Plug 'unblevable/quick-scope'
                " hi QuickScopePrimary cterm=italic
                " hi QuickScopeSecondary cterm=italic
                let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

            " filebrowser
            Plug 'scrooloose/nerdtree'
                map <C-n> :NERDTreeToggle<CR>

            " syntax
            Plug 'mboughaba/i3config.vim'
            Plug 'calviken/vim-gdscript3'
            Plug 'Yggdroot/indentLine'

            " colorschemes
            Plug 'fxn/vim-monochrome'
                let g:monochrome_italic_comments = 1
            Plug 'morhetz/gruvbox'
                let g:gruvbox_contrast_light = 'soft'
                let g:gruvbox_contrast_dark = 'hard'
                let g:gruvbox_bold = 1
                let g:gruvbox_italic = 1
                let g:gruvbox_underline = 1
                let g:gruvbox_undercurl = 1
                let g:gruvbox_imporoved_strings = 1
        call plug#end()

        if g:PlugFresh == 1
            echo "Installing plugins. close following window with 'q'."
            echo ".vimrc will get reloaded automatically."
            augroup PlugFresh
                autocmd VimEnter * PlugInstall
                autocmd VimEnter * so $MYVIMRC
            augroup END
        endif
    endif


"" -- Plug        |}}}
"" -- functional  |{{{

    "" - sets 'n' lets |{{{
        set nocompatible          " reset some default settings
        set encoding=utf8         " encoding inside vim
        set wildmenu              " show possible command completions
        set lazyredraw
        set expandtab             " use spaces instead of tabs
        set shiftwidth=4          " shifted spaces with >> or << command
        set softtabstop=4         " number of spaces that count as a tab
        set splitbelow splitright " set default split to left and bottom
        set hlsearch              " highlight search
        set incsearch             " serach incrementally
        set foldmethod=marker     " default foldmethod
        set noswapfile            " disable swapfile

        filetype plugin indent on

        set clipboard+=unnamedplus


    "" - defaults |}}}
    "" - specials |{{{

        " disbale automatic commenting on new line
        autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

        " delete all trailing whitespace when saved
        autocmd BufwritePre * %s/\s\+$//e

        " enable backspace in insert mode
        set backspace=indent,eol,start

        " red backgound at n line length
        autocmd FileType python,sh,c,cpp,h,vim match ErrorMsg '\%>88v.\+'


    "" - specials |}}}


"" -- functional  |}}}
"" -- keymapping  |{{{

    " leader
        let mapleader = ","
        nnoremap <space> <C-w>

    " reload .vimrc
        nnoremap <leader>c :so $MYVIMRC<CR>

    " defaults
        nnoremap Y y$
        nnoremap U <C-r>
        nnoremap S hs

    " terminal
        nnoremap <leader>s :shell<CR>
        nnoremap <leader>t :terminal<CR>
        nnoremap <leader>v :vert terminal<CR>

    " hilighting
        nnoremap <C-h> :nohlsearch<CR>


"" -- keymapping  |}}}
"" -- visual      |{{{

    "" - general     |{{{
        set number relativenumber " show linenumbers
        set cursorline            " highlight cursorline
        set noshowcmd             " don't show cmd in lower right corner
        set noshowmode            " don't show mode
        set showmatch             " highlight brackets
        set scrolloff=3           " scrolloffset
        set fillchars=""          " disable characters in window seperators

        " non-printable characters
        set showbreak=\\
        set listchars+=tab:..,nbsp:~,trail:_,extends:>,precedes:<

        " enable 24-bit colors
        set t_8f=[38;2;%lu;%lu;%lum
        set t_8b=[48;2;%lu;%lu;%lum
        set termguicolors

        " tmux
        set t_ZH=[3m
        set t_ZR=[m

        " highlight cursorline only on current window
        " augroup hidecursor
        "     autocmd WinLeave * set nocursorline
        "     autocmd WinEnter * set cursorline
        " augroup END


    "" - general     |}}}
    "" - colorscheme |{{{

        set background=dark

        colorscheme monochrome

        hi normal guibg=NONE
        hi CursorLine guibg=#000000

        " colorscheme specific settings
        if g:colors_name ==? "gruvbox"
            hi LineNr       cterm=italic
            hi CursorLineNr cterm=bold,italic guibg=#000000
            hi Folded       cterm=italic      guibg=#101010
            hi Terminal     guifg=#a89984

            let g:terminal_ansi_colors = [
                        \ "#282828", "#cc241d", "#98971a", "#d79921",
                        \ "#458588", "#b16286", "#689d6a", "#a89984",
                        \ "#928374", "#fb4934", "#b8bb26", "#fabd2f",
                        \ "#83a598", "#d4869b", "#8ec07c", "#ebdbb2"
                        \ ]

        elseif g:colors_name ==? "monochrome"
            hi LineNr       cterm=italic
            hi CursorLineNr cterm=bold,italic
            hi Folded       cterm=italic      guibg=#181818
            hi Terminal     guifg=#a89984

            let g:terminal_ansi_colors = [
                        \ "#000000", "#5f2322", "#5a7358", "#222322",
                        \ "#3b3c3a", "#5a5c58", "#80837d", "#acb0a9",
                        \ "#080808", "#101110", "#222322", "#3b3c3a",
                        \ "#5a5c58", "#80837d", "#acb0a9", "#dee4db"
                        \ ]
        endif


    "" - colorcheme |}}}


"" -- coloring    |}}}
"" -- statusline  |{{{

    set laststatus=2
    set statusline=\ %n\ %f%=Row\ %2c\ \ \ \ Line\ %4l\  " comment to preserve space


"" -- statusline  |}}}
"" -- cursorstyle |{{{

    if exists("$TMUX")
        let &t_EI = "\ePtmux;\e\e[2 q\e\\"
        let &t_SI = "\ePtmux;\e\e[6 q\e\\"
        let &t_SR = "\ePtmux;\e\e[4 q\e\\"
    else
        let &t_EI = "\<Esc>[2 q"
        let &t_SI = "\<Esc>[6 q"
        let &t_SR = "\<Esc>[4 q"
    endif

    augroup CursorOnEnter
        autocmd! ShellCmdPost *
        autocmd ShellCmdPost  * silent exec "!printf '" . &t_EI . "'"
        autocmd ShellCmdPost  * redraw!
        autocmd! VimEnter     *
        autocmd VimEnter      * silent exec "!printf '" . &t_EI . "'"
        autocmd VimEnter      * redraw!
    augroup END


"" cursorstyle |}}}
