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
Plug 'ryanoasis/vim-devicons'
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
Plug 'joshdick/onedark.vim'
" Plug 'hachy/eva01.vim''
Plug 'arcticicestudio/nord-vim'

" Nerd Tree
Plug 'preservim/nerdtree'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Nextval
Plug 'qwertologe/nextval.vim'

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

" set background=dark
" colorscheme palenight
" let g:lightline = { 'colorscheme': 'palenight' }
" colorscheme nord


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
nnoremap <leader>n :NERDTreeFocus<CR>

" Map leader to space bar
nnoremap <SPACE> <Nop>
let mapleader=" "
nmap <unique> <Leader>s vip:sort u<CR>
nmap <unique> <Leader>u o<ESC>
nmap <unique> <Leader>d O<ESC>
" nnoremap <silent> <C-a> ggVG

nmap <silent> <unique> + <Plug>nextvalInc
nmap <silent> <unique> - <Plug>nextvalDec
nmap <unique> <Leader>} I//<ESC>A<ESC>

" Preview Window
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" Custom onedark theme
colorscheme onedark

" Normal         xxx ctermfg=145 ctermbg=235 guifg=#ABB2BF guibg=#282C34
highlight Normal guibg=#202328
highlight MatchParen guifg=#C678DD guibg=#504066
highlight LineNr    guifg=#151822
highlight CursorLineNr guifg=#56B6C2
highlight Error guifg=#f57373 guibg=#804040
highlight vimError guifg=#f57373 guibg=#804040

hi IndentGuidesEven guibg=#2a2e30 guifg=#24282a
hi IndentGuidesOdd guibg=#262a2c guifg=#24282a
hi Comment cterm=italic guifg=#4a5158
hi String guifg=#98C379 guibg=#2a2e34

""" browns
" function params: numbers and constants
" hi Keyword guifg=#907161
" hi Statement guifg=#56B6C2
" hi Conditional guifg=#56B6C2

" Yellows
hi Number guifg=#E5C07B
hi Special guifg=#E5C07B
hi Boolean guifg=#E5C07B
hi Type guifg=#F0A15F
" #D19A66

" purple
hi CtrlPMatch guifg=#ba9ef7
hi Visual guibg=#364652
hi Keyword guifg=#ba9ef7
hi Function guifg=#5682A3

" dark grey, RUST preproc
hi Preproc guifg=#37505C

""" Pink
"""""" vim-jsx ONLY
hi Identifier guifg=#D96Ab2
" hi Identifier cterm=italic guifg=#D96Ab2
" hi Statement guifg=#D96AB2
hi Conditional guifg=#D96AB2

""" Go and Python
" Light blue
autocmd FileType python,go highlight Keyword guifg=#59ACE5
autocmd FileType python,go highlight goDeclaration guifg=#59ACE5
" Dark blue
autocmd FileType python,go highlight Function guifg=#2974a1
autocmd FileType python,go highlight goConditional guifg=#2974a1
" cyan
autocmd FileType python,go highlight goStatement guifg=#56B6C2
autocmd FileType python,go highlight goRepeat guifg=#56B6C2


" " dark red
" hi tsxTagName guifg=#E06C75
" " orange
" hi tsxCloseString guifg=#F99575
" hi tsxCloseTag guifg=#F99575
" hi tsxAttributeBraces guifg=#F99575
" hi tsxEqual guifg=#F99575
" " yellow
" hi tsxAttrib guifg=#F8BD7F cterm=italic

" light blue
hi tsxTagName guifg=#59ACE5
hi tsxComponentName guifg=#59ACE5
" dark blue
hi tsxCloseString guifg=#2974a1
hi tsxCloseTag guifg=#2974a1
hi tsxAttributeBraces guifg=#2974a1
hi tsxEqual guifg=#2974a1
hi tsxCloseTagName guifg=#2974a1
hi tsxCloseComponentName guifg=#2974a1
" green
hi tsxAttrib guifg=#1BD1C1


" cyan
hi Constant guifg=#56B6C2
hi typescriptBraces guifg=#56B6C2
hi typescriptEndColons guifg=#56B6C2
hi typescriptRef guifg=#56B6C2
hi typescriptPropietaryMethods guifg=#56B6C2
hi typescriptEventListenerMethods guifg=#56B6C2
hi typescriptFunction guifg=#56B6C2
hi typescriptVars guifg=#56B6C2
hi typescriptParen guifg=#56B6C2
hi typescriptDotNotation guifg=#56B6C2
hi typescriptBracket guifg=#56B6C2
hi typescriptBlock guifg=#56B6C2
hi typescriptJFunctions guifg=#56B6C2
hi typescriptSFunctions guifg=#56B6C2
hi typescriptInterpolationDelimiter guifg=#56B6C2
hi typescriptExceptions guifg=#DDA671
" hi typescriptIdentifier guifg=#907161
" hi typescriptStorageClass guifg=#907161
hi typescriptIdentifier guifg=#65809D
hi typescriptStorageClass guifg=#65809D
" JSON
hi jsonCommentError cterm=italic guifg=#4a5158

" javascript
hi jsParens guifg=#56B6C2
hi jsObjectBraces guifg=#C678DD
hi jsFuncBraces guifg=#56B6C2
hi jsObjectFuncName guifg=#D19A66
hi jsObjectKey guifg=#56B6C2

" vim-jsx-typescript
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66


" JSX Dark Blue and Neon Green highlights
hi xmlEndTag guifg=#2974a1
" hi tsxCloseString guifg=#2974a1
hi tsxCloseString guifg=#15608f
hi htmlTag guifg=#2974a1
hi htmlEndTag guifg=#2974a1
hi htmlTagName guifg=#59ACE5
hi tsxAttrib guifg=#1BD1C1

hi tsxTypeBraces guifg=#BDA7CC
hi tsxTypes guifg=#8D779C
hi tsxIfOperator guifg=#56B6C2
hi tsxElseOperator guifg=#56B6C2


" rust cyan
hi rustModPath guifg=#DF997A
hi rustFuncCall guifg=#60A0D0
hi rustFuncName guifg=#60A0D0
hi rustTrait guifg=#C898C8
hi rustCommentLine guifg=#aaaaaa guifg=#444444


hi rustFoldBraces guifg=#FFEAD0
hi rustBoxPlacementBalance guifg=#C898C8

hi ALEError      guibg=#612E2D cterm=italic
hi ALEWarning    guibg=#523D30 cterm=italic
" Coc linting colors
hi CocErrorHighlight   guibg=#612E2D cterm=italic
hi CocWarningHighlight guibg=#523D30 cterm=italic
hi CocHighlightText    guibg=#40334A

hi CocInfoHighlight    guibg=#A5BFD5 cterm=italic
hi CocHintHighlight    guibg=#A5BFD5 cterm=italic

hi CocErrorSign   guifg=#CD584F
hi CocWarningSign guifg=#D3785D

