"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NOTES
"
" Command-T
"   need ruby18; does not work with other versions;
"   can be installed using MacPort:
"
"       sudo port install ruby18
"       sudo port select --set ruby ruby18
"
" YouCompleteMe
"   need Apple python instead of MacPort's version,
"   therefore need a binary distribution of MacVim
"   (instead of MacPort's version)
"   semantic completion can be linked to Apple's libclang,
"   so no need to download from official llvm.
"   However the headers of C++ STL won't be found unless
"   the path
"
"       /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/c++/v1
"
"   is specified in .ycm_extra_conf.py.
"   The path can be obtained by checking:
"
"       clang --std=c++98 -E -v -x c++ -
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Command-T'
Plugin 'bufkill.vim'
Plugin 'restore_view.vim'
Plugin 'The-NERD-Commenter'
Plugin 'The-NERD-tree'
Plugin 'FSwitch'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'Raimondi/delimitMate'
"Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'nanotech/jellybeans.vim'
Plugin 'vimwiki/vimwiki'
call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700
" Set to auto read when a file is changed from the outside
set autoread
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
" Fast saving
nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color
set t_Co=256
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
" Turn on the Wild menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
"Always show current position
set ruler
" Height of the command bar
set cmdheight=2
" A buffer becomes hidden when it is abandoned
set hid
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" mark column 80
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
" Colorscheme
colorscheme jellybeans
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,mac,dos
" Highlight color for matching parens
highlight MatchParen ctermfg=lightblue ctermbg=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Linebreak on 500 characters
set lbr
set tw=500
" Auto indent
set ai
" Smart indent
set si
" Wrap lines
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <space> /
nmap <leader><cr> :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => buffer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <left> :bp<cr>
nmap <right> :bn<cr>
" Close a buffer via bufkill
nmap <leader>bd :BD<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>nt :NERDTree<cr>
" open nerdtree if no file is opened
au VimEnter * if !argc() | NERDTree | endif
" exit vim if the nerdtree window is the only window
au BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType")
    \ && b:NERDTreeType == "primary") | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDCommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDRemoveExtraSpaces = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => moving around windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <M-tab> <c-w><c-w>
noremap <M-j>   <C-W>j
noremap <M-k>   <C-W>k
noremap <M-h>   <C-W>h
noremap <M-l>   <C-W>l
" When working in remote shells
noremap ∆       <C-W>j
noremap ˚      <C-W>k
noremap ˙      <C-W>h
noremap ¬       <C-W>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => source .vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>v :so ~/.vimrc<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => switch working directory to file location
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cmap cd. lcd %:p:h
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd BufEnter * silent! lcd %:p:h
map <leader>k :make clean<cr>
map <leader>m :make -j<cr>

" location-list & quickfix
nmap <silent> <c-j> :lnext<cr>
nmap <silent> <c-k> :lprevious<cr>
nmap <silent> <c-s-j> :cnext<cr>
nmap <silent> <c-s-k> :cprevious<cr>

" quick swtiching to .cpp/.h counterpart
au! BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = './'
au! BufEnter *.hpp let b:fswitchdst = 'cpp' | let b:fswitchlocs = './'
"nmap <silent> <leader>s :FSHere<cr>
nmap <silent> <leader>sl :FSRight<cr>
nmap <silent> <Leader>sL :FSSplitRight<cr>
nmap <silent> <leader>sh :FSLeft<cr>
nmap <silent> <Leader>sH :FSSplitLeft<cr>

" Dash
nmap <silent> <leader>h <Plug>DashSearch

"" easytags
"let g:easytags_dynamic_files = 2
"let g:easytags_on_cursorhold = 0
"let g:easytags_auto_highlight = 0
"let g:easytags_events = []
"au BufWritePost *.cpp,*.h,*.c UpdateTags

au! BufWritePost *.cpp,*.hpp,*.h,*.c silent !ctags -R
        \ --c++-kinds=+p --fields=+iaSl --extra=+q
au! BufWritePost *.py silent !ctags -R --fields=+iaSl --extra=+q

" cscope
"au BufWritePost *.cpp,*.h,*.c silent !cscope -bqk -i cscope.files
"            \ -f cscope.out | cs reset
"set cscopequickfix=g-,s-,c-,d-,i-,t-,e-

" rebuild cscope + ctags database
"nmap <leader>cd :silent !find . -iname '*.c' -o -iname '*.cpp'
"          \ -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
"          \:silent !cscope -bqku -i cscope.files -f cscope.out<CR>
"          \:silent cscope reset<CR>
"          \:silent UpdateTags! -R .<CR>

" restore_view
set viewoptions=cursor,folds,slash,unix
" let g:skipview_files = ['*\.vim']

" YouCompleteMe
au BufEnter * if (&ft=='c' || &ft=='cpp') | nmap<c-]> :YcmCompleter GoTo<CR>|
        \else | nmap<c-]> :exec("tag ".expand("<cword>"))<CR>| endif
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1

" ultisnips
let g:UltiSnipsExpandTrigger = "<c-e>"
let g:UltiSnipsJumpForwardTrigger = "<c-e>"
let g:UltiSnipsJumpBackwardTrigger = "<c-w>"

"" supertab
"let g:SuperTabDefaultCompletionType = '<c-n>'

" syntastic
" let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1

" gitgutter
let g:gitgutter_enabled = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_lines = 1
nmap <leader>g :GitGutterToggle<CR>

" for command-t
let g:CommandTTraverseSCM = "pwd"

" search selected text
vnoremap // y/<C-R>"<CR>

" run current script
nnoremap <leader><leader> :!./%<cr>

" mini buffer explorer
let g:miniBufExplBRSplit = 0
let g:miniBufExplorerAutoStart = 0
let g:miniBufExplBuffersNeeded = 0
map <leader>be :MBEToggle<cr>
"map <leader>bn :MBEbn<cr>
"map <leader>bp :MBEbp<cr>
noremap <C-TAB>   :MBEbn<CR>
"noremap <C-S-TAB> :MBEbb<CR>

" vim-airline
let g:airline_theme = 'light'
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1

" remove trailing spaces
map <leader>. :%s/\s\+$//g<cr>

