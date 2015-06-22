"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => general
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    set guifont=DeJavu\ Sans\ Mono:h14
    "set guifont=DeJavu\ Sans\ Mono\ for\ Powerline:h14
    "let g:airline_powerline_fonts = 1
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => for command-t plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
    set macmeta
endif
