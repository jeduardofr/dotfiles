" Set compatibility to Vim Only
set nocompatible

" Helps force plugs-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting
syntax on

" For plug-ins to load correctly
filetype plugin indent on

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length
set wrap

" Space configurations
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set expandtab
set scrolloff=5

set backspace=indent,eol,start

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.,space:_
set number
set relativenumber

" set swapfile
" set dir=~/tmp
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

" Search
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'jwalton512/vim-blade'
Plug 'Yggdroot/indentLine'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mxw/vim-jsx'
Plug 'editorconfig/editorconfig-vim'
Plug 'cohama/lexima.vim'

" Themes
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'fxn/vim-monochrome'
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim'
Plug 'drewtempelmeyer/palenight.vim'

" Nerd Tree
Plug 'preservim/nerdtree'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

call plug#end()

" Fuzzy Finder
" let g:fzf_tags_command = "ctags -R --exclude=vendor --exclude=public"
map <C-p> :FZF<Cr>

" Change between tabs with Alt+Tab
map <Tab> :tabn<Cr>
map <S-Tab> :tabp<Cr>

" Map to toggle windows
nnoremap <A-j> <C-W>j
nnoremap <A-k> <C-W>k
nnoremap <A-l> <C-W>l
nnoremap <A-h> <C-W>h

" Theme
set termguicolors

" colorscheme gruvbox
" let g:lightline = { 'colorscheme': 'gruvbox' }

set background=dark
colorscheme palenight
let g:lightline = { 'colorscheme': 'palenight' }

" Display double quotes in json file
let g:indentLine_setConceal = 0

" Set default make command
" map <unique> <F1> <ESC>:make<CR>
" set makeprg=make\ -w

" Vertical Ruler for length of lines
set cc=80 " Highlight column at 80
set ru

let g:netrw_nogx = 1

" Nerd tree
nnoremap <C-t> :NERDTreeToggle<CR>

" Map leader to space bar
nnoremap <SPACE> <Nop>
let mapleader=" "
nmap <unique> <Leader>s vip:sort u<CR>

" Preview Window
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
