set tags+=/home/un/Project/cs492-final-project/tags
set tags+=/home/sgx2/Exclave/linux-sgx-2.1/tags
set tags+=/home/sgx2/Exclave/linux-sgx-driver-2/tags
set tags+=/home/jupark/decoupled_at_zsim/tags

if empty(glob('~/.vim/autoload/plug.vim'))                              
   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs             
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   au VimEnter * PlugInstall --sync | source $MYVIMRC                   
endif     

call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-fugitive'
call plug#end()

" cscope
if has("cscope")
    set csto=0
    cs add cscope.out
    if $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    else
        cs add /home/jupark/decoupled_at_zsim/cscope.out
    "else
    "    cs add /usr/src/linux-source-2.6.22/cscope.out
    endif
    set cscopeverbose

    " cscope/vim key mappings
    " 's' symbol: find all references to the token under cursor
    " 'g' global: find global definition(s) of the token under cursor
    " 'c' calls:  find all calls to the function name under cursor
    " 't' text:   find all instances of the text under cursor
    " 'e' egrep:  egrep search for the word under cursor
    " 'f' file:   open the filename under cursor
    " 'i' includes: find files that include the filename under cursor
    " 'd' called: find functions that function under cursor calls
    nmap <C-[>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[>f :cs find f <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[>i :cs find i <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[>d :cs find d <C-R>=expand("<cword>")<CR><CR>

    " CTRL-space <C-@> search and split horizonal window
    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :scs find f <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>i :scs find i <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

    " CTRL-space CTRL-space vertical split
    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>i :vert scs find i <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
    " key map timeout
    "set notimeout
    " Or
    "set timetouteln=4000
    "set ttimeout
    "set ttimeoutlen=100
endif

let g:airline_theme='jellybeans'
set hlsearch " 검색어 하이라이팅
set nu " 줄번호
set autoindent " 자동 들여쓰기
set scrolloff=2
set wildmode=longest,list
set ts=4 "tag select
set sts=4 "st select
set sw=1 " 스크롤바 너비
set autowrite " 다른 파일로 넘어갈 때 자동 저장
set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
set cindent " C언어 자동 들여쓰기
set bs=eol,start,indent
set history=256
set laststatus=2 " 상태바 표시 항상
set shiftwidth=4 " 자동 들여쓰기 너비 설정
set showmatch " 일치하는 괄호 하이라이팅
set smartcase " 검색시 대소문자 구별
set smarttab
set smartindent
set softtabstop=4
set tabstop=4
set ruler " 현재 커서 위치 표시
set incsearch
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
set paste " 붙여넣기
" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif
" 파일 인코딩을 한국어로
if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif
" 구문 강조 사용
if has("syntax")
 syntax on
endif
" 컬러 스킴 사용
colorscheme jellybeans

set backupdir=~/.vim/undo-history
set directory=~/.vim/undo-history

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
