set nonumber
set title
set showcmd
set vb t_vb=

" Search
	"小文字のときに大文字小文字の区別をなくす
	set ignorecase
	"大文字を区別する
	set smartcase
	"検索文字のハイライト
	set hlsearch

" syntax color
syntax on
colorscheme ron
highlight LineNr ctermfg=lightyellow

" Vim-Suite
" REQUIRED. This makes vim invoke latex-suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" コンパイル時に使用するコマンド
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*' 
let g:Tex_BibtexFlavor = 'jbibtex'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'"
" ファイルのビューワー
 let g:Tex_ViewRule_dvi = 'xdvi'
 let g:Tex_ViewRule_pdf = 'evince'
"
let g:TeX_flavor = 'latex'
let g:neocomplcache_enable_at_startup = 1
