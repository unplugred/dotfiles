"source /media/unplugred/Data/repos/vimrc/.vimrc

" vimplug
call plug#begin('~/.local/share/nvim/plugged')
" icons for nerd tree
Plug 'ryanoasis/vim-devicons', { 'on': 'NERDTreeToggle' }
" nerd tree my beloved, ctrl n
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
" ctrl p to look for files
Plug 'ctrlpvim/ctrlp.vim'
" css colors highlighted very cool
Plug 'ap/vim-css-color'
" color theme that ill eventually grow out of
Plug 'junegunn/seoul256.vim'
" git diff
Plug 'mhinz/vim-signify'
" focus mode
Plug 'junegunn/limelight.vim', { 'on': 'Goyo' }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
" rainbow parentheses
Plug 'junegunn/rainbow_parentheses.vim'
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

" rainbow parentheses
au VimEnter * RainbowParentheses

" zoom hotkeys
let g:neovide_scale_factor=1.0
function! ChangeScaleFactor(delta)
  let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
endfunction
nnoremap <expr><C-ScrollWheelUp> ChangeScaleFactor(1.05)
nnoremap <expr><C-ScrollWheelDown> ChangeScaleFactor(1/1.05)

" transparency
let g:neovide_transparency=0.9
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" transparency hotkeys
function! ChangeTransparency(delta)
  let g:neovide_transparency = g:neovide_transparency + a:delta
endfunction
noremap <expr><C-S-ScrollWheelUp> ChangeTransparency(0.02)
noremap <expr><C-S-ScrollWheelDown> ChangeTransparency(-0.02)

" spell check
setlocal spell spelllang=en_us

" focus mode
set scrolloff=5
function! s:goyo_enter()
  Limelight
  set scrolloff=20
endfunction
function! s:goyo_leave()
  Limelight!
  set scrolloff=5
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" tabs superiority
set tabstop=4
set shiftwidth=4
set noexpandtab

" some more color theme action
let g:seoul256_background = 235
color seoul256
set background=dark
let g:terminal_color_0 = '#4e4e4e'
let g:terminal_color_1 = '#d68787'
let g:terminal_color_2 = '#5f865f'
let g:terminal_color_3 = '#d8af5f'
let g:terminal_color_4 = '#85add4'
let g:terminal_color_5 = '#d7afaf'
let g:terminal_color_6 = '#87afaf'
let g:terminal_color_7 = '#d0d0d0'
let g:terminal_color_8 = '#626262'
let g:terminal_color_9 = '#d75f87'
let g:terminal_color_10 = '#87af87'
let g:terminal_color_11 = '#ffd787'
let g:terminal_color_12 = '#add4fb'
let g:terminal_color_13 = '#ffafaf'
let g:terminal_color_14 = '#87d7d7'
let g:terminal_color_15 = '#e4e4e4'
highlight Terminal guibg='#3a3a3a'
highlight Terminal guifg='#d0d0d0'


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
