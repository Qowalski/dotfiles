call plug#begin('~/.vim/plugs')
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'mboughaba/i3config.vim'
	Plug 'calviken/vim-gdscript3'
call plug#end()

set wildmenu              " show possible command completions
set lazyredraw
set expandtab             " use spaces instead of tabs
set shiftwidth=4          " shifted spaces with >> or << command
set softtabstop=4         " number of spaces that count as a tab
set splitbelow splitright " set default split to left and bottom
set hlsearch              " highlight search
set incsearch             " serach incrementally

filetype plugin indent on
set noswapfile            " disable swapfile

" disbale automatic commenting on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" delete all trailing whitespace when saved
autocmd BufwritePre * %s/\s\+$//e

" enable backspace in insert mode
set backspace=indent,eol,start

set number relativenumber " show linenumbers

set noshowcmd             " don't show cmd in lower right corner
set noshowmode            " don't show mode
set showmatch             " highlight brackets
set scrolloff=3           " scrolloffset
set fillchars=""          " disable characters in window seperators

set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

set termguicolors

set t_ZH=[3m
set t_ZR=[m

if exists("$TMUX")
	let &t_EI = "\ePtmux;\e\e[2 q\e\\"
	let &t_SI = "\ePtmux;\e\e[6 q\e\\"
	let &t_SR = "\ePtmux;\e\e[4 q\e\\"
elseif exists("$STY") " screen
	let &t_EI = "\eP\e\e[2 q\e\\"
	let &t_SI = "\eP\e\e[6 q\e\\"
	let &t_SR = "\eP\e\e[4 q\e\\"
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
