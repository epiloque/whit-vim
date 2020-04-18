scripte utf-8
set nocp
filetype off

if has('vim_starting')
    set rtp+=~/.vim/vendor/dein.vim
endif

if filereadable(expand('~/.vim/.ready'))
    call dein#begin(expand('~/.vim/bundle'))

    if filereadable(expand('~/.vim/vim-bundles'))
      source ~/.vim/vim-bundles
    endif

    call dein#end()
    call dein#save_state()

    filetype plugin indent on
endif

syntax enable

set fenc=utf8 enc=utf8 secure so=5 shm=atI vb t_vb= novb noeb
set dir=~/.vim/tmp/sessions bdir=~/.vim/tmp/backup
set nosol tf nonu ru sc sb spr nofen ve=onemore backup
set gcr=a:blinkon0 ls=2 hi=5000
set hls is ws ic scs so=3 sj=5 siso=7 ss=1 fo-=o sw=4 sts=4 et ai hid
set cpt+=kspell cpt-=t bs=indent,eol,start vi+=! vi='250,<0,r/tmp
set lcs=eol:¬,trail:· shm+=filmnrxoOtT ww=<,>,h,l noswf mat=2 ar
set ruf=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) wmnu wim=list:longest,full
set wig+=*/.git/*,*/.hg/*,*/.svn/*,*.aux,*.out,*.toc,*.jpg,*.bmp,*.gif
set wig+=*.luac,*.o,*.obj,*.exe,*.dll,*.manifest,*.spl,*.py[co]
set clipboard=unnamedplus go+=a nuw=6
set list listchars=tab:¨¨,trail:·,eol:¬
set noeb vb t_vb=
set bkc=yes nowrap
set ch=2 noshowmode nolist
au GUIEnter * set vb t_vb=
set formatoptions-=t

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

try
    set udir=~/.vim/tmp/undo cc=+1 undofile
catch /Unknown option/
    " versions of Vim prior to 7.3
endtry

let g:dein#types#git#clone_depth="1"
let mapleader="\\"

if filereadable(expand("~/.vim/.ready"))
    nn <space> :BufMRUNext<CR>
    nn <leader><space> :BufMRUPrev<CR>
    nn <right> :BufMRUNext<CR>
    nn <left> :BufMRUPrev<CR>

    "Mnemonic: [F]iles
    nn <leader>f :Files<CR>

    "Mnemonic: [B]uffer
    nn <leader>b :Buffers<CR>

    "Mnemonic: Choose [W]indow
    nn <leader>w :ChooseWin<CR>

    "Mnemonic: Fi[x]
    nn <leader>x :call CocAction('format')<CR>

    "Mnemonic: [C]ommands
    nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>

    "Mnemonic: Show all [d]iagnostics
    nnoremap <silent> <leader>d  :<C-u>CocList diagnostics<cr>

    "Mnemonic: Manage [E]xtensions
    nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>

    "Mnemonic: [Outline]
    nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>

    "Mnemonic: [S]ymbols
    nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>

    "Mnemonic: [R]emap for [R]ename current word
    nmap <leader>r <Plug>(coc-rename)

    "Mnemonic: [Q]uiet
    nmap <leader>q  <Plug>(coc-fix-current)

    "Mnemonic: [A]ction
    nmap <leader>a  <Plug>(coc-codeaction)

    "Mnemonic: [N]ext [P]rev
    nmap <silent> <C-p> <Plug>(coc-diagnostic-prev)
    nmap <silent> <C-n> <Plug>(coc-diagnostic-next)

    "Mnemonic: [G]oto
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    "Mnemonic: Ali[gn]
    "Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap gn <Plug>(EasyAlign)
    "Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap gn <Plug>(EasyAlign)

    for fpath in split(globpath('~/.vim/settings', '*.vim'), '\n')
      exe 'source' fpath
    endfor
endif
