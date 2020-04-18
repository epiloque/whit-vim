let g:airline#extensions#hunks#enabled       = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#syntastic#enabled   = 0
let g:airline_exclude_preview                = 1
let g:airline_powerline_fonts                = 0
let g:airline_skip_empty_sections            = 1
let g:airline_skip_empty_sections            = 1
let g:airline_theme                          = "monocolor_white"
let g:airline_section_error                  = ""
let g:airline_right_alt_sep                  = ""

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.space     = "\ua0"
let g:airline_symbols.linenr    = ''
let g:airline_symbols.linenr    = ''
let g:airline_symbols.notexists = "?"
let g:airline_symbols.maxlinenr = ''

au FileType help,qf setl nowrap nofen nospell nocul nolist
au FileType help,qf setl stl=\ %n\ \ %f%=%L\ lines
highlight clear SignColumn

" autocmd FileType * unlet! g:airline#extensions#whitespace#checks
" autocmd FileType taskedit let g:airline#extensions#whitespace#checks = [ 'indent' ]
" autocmd FileType mail let g:airline#extensions#whitespace#checks = [ 'indent' ]

function CheckConsole()
    let l:isconsole = 0

    if exists('$SSH_CLIENT')
        let l:isconsole = 0
    elseif exists('$SSH_TTY')
        let l:isconsole = 0
    endif

    if !empty(glob("/.dockerinit"))
        let l:isconsole = 0
    endif

    return l:isconsole
endfunction

if CheckConsole() == 1
    set bg=dark " term=linux
    colo slate
    syntax on
else
    set mouse=nv
    if $COLORTERM == 'truecolor'
        set termguicolors
    endif
    colo monocolor_white
endif

augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END
