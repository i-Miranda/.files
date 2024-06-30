"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                         "
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗                   "
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝                   "
"               ██║   ██║██║██╔████╔██║██████╔╝██║                        "
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║                        "
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗                   "
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝                   "
"                                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"Disable Vi compatibility
set nocompatible
set backspace=indent,eol,start

"Indentation
set autoindent
set shiftwidth=4
set shiftround
set tabstop=4
set smarttab
set expandtab

"Enable filetype detection
filetype on
filetype plugin on
filetype indent on

set number
set relativenumber
set textwidth=79
set nowrap
set signcolumn=number
set foldcolumn=1

"Hides '|' in vertical split
set fillchars+=vert:\ 

"Search options
set path+=**
set incsearch
set hlsearch
set ignorecase
set smartcase

set cursorline
set colorcolumn=80

set splitright splitbelow

set noerrorbells
set visualbell

set showcmd
set showmatch
set showmode

"Performance options
" Screen doesn't update during macro or script execution
set lazyredraw

set history=1000

set undodir=~/.vim/backup
set undofile
set undoreload=10000

set termwinsize=8x0

set wildmenu
set wildmode=longest:list,full
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"KEYMAPS {{{
nnoremap <space> <Nop>
let mapleader = " "

"Increment and Decrement numbers
nnoremap <leader>+ <c-a>
"conflicts with :split shortcut
nnoremap <leader>- <c-x>

"Center cursorline
nnoremap j jzz
nnoremap k kzz
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <s-h> <s-h>zz
nnoremap <s-l> <s-l>zz
nnoremap gg ggzzzv

nnoremap o o<esc>
nnoremap O O<esc>

nnoremap <leader>cc ~h
vnoremap <leader>cc ~

nnoremap <leader>nh :nohlsearch<CR>

"Window navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"Window splits
nnoremap <leader>- :split<CR>
nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>l :vert res 9999<CR>
nnoremap <leader>k <c-w>_
nnoremap <leader><space> <c-w>=
nnoremap <leader>q :q<CR>

nnoremap <leader>bb :rightb vnew<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>
nnoremap <leader>bq :bun<CR>
nnoremap <leader>bd :bdel<CR>

nnoremap <leader>tt :tabnew<CR>
nnoremap <leader>tT :tabnew %<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprev<CR>
nnoremap <leader>tq :tabclose<CR>
nnoremap <leader>to :tabonly<CR>

nnoremap <leader>ff :find<space>
nnoremap <leader>fb :ls<CR>:b<space>
nnoremap <leader>fo :Lexplore<CR>:wincmd L<CR>21<c-w><
nnoremap <leader>fO :Explore<CR>

nnoremap <leader>gd <c-]>

nnoremap <leader>m :terminal<CR>

" added :noh to remove highlight at the end
nnoremap <leader>so :w<CR>:so<space>%<CR>:noh<CR>
nnoremap <leader><c-r> :reg<CR>

inoremap jj <esc>
" }}}

"VIMSCRIPT {{{
augroup filetype_vim
    autocmd filetype vim setlocal foldmethod=marker
augroup end

augroup help_vert
    autocmd FileType help wincmd L
    autocmd FileType help set wrap
    autocmd FileType help set linebreak
augroup END

" Display cursorline in active window.
augroup cursor_off
    autocmd WinLeave * set nocursorline 
    autocmd WinEnter * set cursorline 
augroup END

"Create the 'tags' file.  (ctags required: brew install ctags)
command! MakeTags !ctags -R .
    "NOW WE CAN:
    " - Use ^] to jump to tag under cursor
    " - Use g^] for ambiguous tags
    " - Use t^ to jump back up the tag stack

" }}}

"STATUS LINE {{{
" Clear status line when vimrc is reloaded.
set ruler
set statusline=

" Status line left side.
set statusline+=\ %n\ %F\ %m\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ %y\ ascii:\%b\ hex:\0x%B\ %l\:%c\ %p%%

" Show the status on the second to last line.
set laststatus=2
" }}}

" netrw {{{
" FILE BROWSING:
" Tweaks for browsing:
let g:netrw_banner=0  "disable banner
let g:netrw_browse_split=4 "open in prior window
let g:netrw_altv=1 "open splits to the right
let g:netrw_liststyle=3 "tree view
let g:netrw_winsize=-20
let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'
    " NOW WE CAN:
    " - edit a folder to open a file browser
    " - <CR>/v/t to open in an h-split/v-split/tab
    " - check |netrw-browse-maps| for more mappings
" }}}

" STYLE {{{
syntax on

" Use a line cursor within insert mode and a block cursor everywhere else.
    "   Reference chart of values:
    "   Ps = 0  -> blinking block.
    "   Ps = 1  -> blinking block (default).
    "   Ps = 2  -> steady block.
    "   Ps = 3  -> blinking underline.
    "   Ps = 4  -> steady underline.  "   Ps = 5  -> blinking bar (xterm).
    "   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[2 q"

set t_Co=256
set termguicolors
colorscheme default
set background=dark

" rosewater = #F2D5CF
" flamingo = #EEBEBE
" pink = #F4B8E4
" mauve = #CA9EE6
" red = #E78284
" maroon = #EA999C
" peach = #EF9F76
" yellow = #E5C890
" green = #A6D189
" teal = #81C8BE
" sky = #99D1DB
" sapphire = #85C1DC
" blue = #8CAAEE
" lavender = #BABBF1
 
" text = #C6D0F5
" subtext1 = #B5BFE2
" subtext0 = #A5ADCE
" overlay2 = #949CBB
" overlay1 = #838BA7
" overlay0 = #737994
" surface2 = #626880
" surface1 = #51576D
" surface0 = #414559

" base = #303446
" mantle = #292C3C
" crust = #232634

highlight Comment cterm=italic guifg=#CA9EE6
highlight Folded cterm=bold,italic guifg=#414559 guibg=#EEBEBE
highlight CursorLine cterm=none guibg=#51576D
highlight CursorLineNr cterm=bold,italic guifg=#85C1DC guibg=#414559
highlight LineNr guifg=#414559 guibg=#CA9EE6
highlight Visual guibg=SlateGray
highlight Search guifg=#303446 guibg=#F2D5CF
highlight IncSearch guifg=#303446 guibg=#F2D5CF 
highlight CurSearch guifg=#303446 guibg=#EA999C 
highlight Normal guifg=#C6D0F5 guibg=#303446
highlight StatusLine guibg=#303446 guifg=#EEBEBE
highlight StatusLineNC guibg=#303446 guifg=#CA9EE6
highlight Type cterm=bold guifg=#A6D189
highlight Constant guifg=#F4B8E4
highlight Special guifg=#E5C890
highlight Underlined guifg=#E78284
highlight PreProc guifg=#99D1DB
highlight Statement guifg=#EEBEBE
highlight Identifier cterm=bold guifg=#99D1DB
highlight Error cterm=bold,italic guifg=#F2D5CF guibg=#EA999C
highlight ErrorMsg cterm=bold,italic guifg=#F2D5CF guibg=#EA999C
highlight TabLine cterm=none guifg=#303446 guibg=#EEBEBE
highlight TabLineSel cterm=bold,italic guifg=#232634 guibg=#CA9EE6
highlight TabLineFill guifg=#EEBEBE
highlight FoldColumn guifg=#737994 guibg=#EEBEBE
highlight ColorColumn guibg=#737994
highlight VertSplit guifg=#CA9EE6
highlight WildMenu cterm=bold guifg=#85C1DC guibg=#303446
highlight NonText guifg=#737994 guibg=#414559
highlight Title guifg=#232634
highlight StatusLineTerm guifg=#303446 guibg=#EEBEBE
highlight StatusLineTermNC cterm=italic guifg=#303446 guibg=#EEBEBE
highlight MatchParen guifg=#303446 guibg=#EA999C

" }}}

" NICE TO KNOW {{{
" set omnifunc=syntaxcomplete#Complete
" AUTOCOMPLETE:
    " The good stuff is documented in |ins-completion|
    " HIGHLIGHTS:
    " - ^x^n for JUST this file
    " - ^x^f for filenames in path
    " - ^x^] for tags only
    " - ^n for anything specified by the 'complete' option

    " NOW WE CAN:
    " - Use ^n and ^p to go back and forth in the suggestion list
" }}}
