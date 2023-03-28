" vimplug
call plug#begin('~/.local/share/nvim/plugged')
" nerd tree my beloved, ctrl n
Plug 'preservim/nerdtree'
" ctrl p to look for files
Plug 'ctrlpvim/ctrlp.vim'
" icons for nerd tree
Plug 'ryanoasis/vim-devicons'
" css colors highlighted very cool
Plug 'ap/vim-css-color'
" color theme that ill eventually grow out of
Plug 'junegunn/seoul256.vim'
" git diff
Plug 'mhinz/vim-signify'
call plug#end()

" root directory to current file
set autochdir

" wild menu
set wildmenu

" hide unnecessary bottom bar
set cmdheight=1
lua vim.o.ls=0
lua vim.o.ch=0

" window title
set title titlestring=%t\ \ %m
set noicon

" line numbers
set nu
set rnu

" show current line
set cursorline

" show whitespace
set listchars=tab:>—,trail:~,extends:>,precedes:<,space:·
set list

" font
set guifont=3270Narrow\ NF:h14
set encoding=UTF-8

" spell check
setlocal spell spelllang=en_us

" tabs superiority
set tabstop=4
set shiftwidth=4
set noexpandtab

" some more color theme action
let g:seoul256_background = 235
color seoul256
set background=dark

" nerdtree binding
map <C-n> :NERDTreeToggle<CR>

" disable bells
set noerrorbells

" auto indent
set autoindent

" no new line at end of file
set nofixendofline

" syntax highlighting for ejs
au BufNewFile,BufRead *.ejs set filetype=html

" smart case searching
set ignorecase
set smartcase

" enable mouse cuz im not a nerd
set mouse=a
aunmenu PopUp.How-to\ disable\ mouse
aunmenu PopUp.-1-

" transparency
let g:neovide_transparency=0.7
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" neovide settings
let g:neovide_remember_window_size=v:true
let g:neovide_hide_mouse_when_typing=v:true

" particles dont judge
let g:neovide_cursor_vfx_mode = "pixiedust"
let g:neovide_cursor_vfx_particle_density = 12.0
let g:neovide_cursor_vfx_particle_lifetime = 0.6

" zsh
set shell=zsh
if has("win32")
	let $CHERE_INVOKING=1
	set shellcmdflag=--login\ -c
	set shellxquote=\"
	set shellslash
	let $PATH .= ';C:\cygwin64\bin'
endif
