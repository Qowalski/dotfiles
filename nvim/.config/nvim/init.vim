"             _
"   ___ _  __(_)_ _
"  / _ \ |/ / /  ' \
" /_//_/___/_/_/_/_/
"


" plugins
call plug#begin('~/.vim/plugs')
    Plug 'tpope/vim-commentary'     " automatic commenting
    Plug 'tpope/vim-surround'       " change surrounding characters
    Plug 'tpope/vim-repeat'         " repeat plugin commands with .
    Plug 'mboughaba/i3config.vim'   " syntax highlighting for i3 config
    Plug 'calviken/vim-gdscript3'   " syntax highlighting for godot's scripting language
    Plug 'vimwiki/vimwiki'          " org mode type of plugin
    Plug 'junegunn/goyo.vim'        " center text
call plug#end()

let g:vimwiki_list = [{'path': '~/documents/wiki'}] " vimwiki defaults

" source vimrc on goyo leave so we get our colors back
au! User GoyoLeave nested so $MYVIMRC
nnoremap <c-g> :Goyo<CR>

" general settings
set splitbelow splitright   " make splitting non retarted
set relativenumber          " relative line numbers
set expandtab               " spaces instead of tabs
set softtabstop=4           " number of spaces for tab
set shiftwidth=4            " number of spaces moved wiht << or >>
set foldmethod=marker       " default foldmethod
set scrolloff=3             " scrolloff so we see can see the future
set noshowmode              " don't show in which mode we are
set hlsearch                " highlight search
set incsearch               " search  while typing

filetype plugin indent on   " filetype sepcific plugins and indentation


" statusline
set laststatus=2
set statusline=\ %f\ [%n]\ %M%R%H%W
set statusline+=%=
set statusline+=Row\ %c%4(\ %)Line\ %l/%L\  " comment to preserve space


" make space more useful
nnoremap <space> <c-w>

" minor mapping changes
nnoremap U <c-r>
nnoremap Y y$
nnoremap S hs

nnoremap '' ''zz


" disable autocommenting on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" delete trailing whitespace on save
autocmd BufwritePre * %s/\s\+$//e


" colorscheme
colorscheme default
hi lineNr                   ctermfg=darkgray
hi cursorlinenr cterm=bold  ctermfg=201
hi comment                  ctermfg=34
hi statusline               cterm=bold ctermfg=16 ctermbg=7
hi statuslineNC             cterm=NONE ctermfg=16 ctermbg=7
hi vertsplit                ctermfg=7 ctermbg=7
hi folded                   ctermfg=0 ctermbg=7


" filetype settings
autocmd Filetype markdown set spell spelllang=de_de
command! Pandoc silent ![ -n "$(command -v pandoc)" ] && pandoc -o %:r.pdf %
command! Pdf silent ![ -n "$(command -v zathura)" ] && zathura %:r.pdf &


" red backgound at n line length
autocmd FileType python,sh,c,cpp,h,vim,gdscript3,gd match ErrorMsg '\%>95v.\+'
