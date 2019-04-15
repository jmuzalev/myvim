let  g:C_UseTool_cmake    = 'yes'
let  g:C_UseTool_doxygen = 'yes' 
set pyx=3
set pyxversion=3
set backspace=indent,eol,start

if has('python3') && !has('patch-8.1.201')
  silent! python3 1
endif

if &compatible
  set nocompatible            " be iMproved, required
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" B
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Shougo/deoplete.nvim'

Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'zchee/deoplete-clang'
Plug 'gnattishness/cscope_maps'
    let g:deoplete#sources#clang#std#c = 'gcc'
	let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-7/lib/libclang.so.1'
	let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-7/lib/clang/7.0.1/include/'
Plug 'xaizek/vim-inccomplete'

      Plug 'sirver/ultisnips'
"    let g:UltiSnipsJumpForwardTrigger="<c-j>"
"    let g:UltiSnipsExpandTrigger="<c-j>"
"    let g:UltiSnipsEditSplit="vertical"
"	let g:UltiSnipsListSnippets="<c-e>"
     Plug 'honza/vim-snippets'
Plug 'mh21/errormarker.vim'
"
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

" YCM
"Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }

" Initialize plugin system
call plug#end()

let g:cscope_preload_path="/usr/include/cscope.out;/usr/local/include/cscope.out;/root/workspace/Cproj/cscope.out"
"set cscopeverbose 
set cscopequickfix=s-,c-,d-,i-,t-,e-

let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat


"function! Addlibcscope()
"	cs add /usr/include/cscope.out<CR>
"	cs add /usr/local/include/cscope.out<CR>
"endfunction
"nmap <F5>  :cs add /usr/include/cscope.out <CR> :cs add /usr/local/include/cscope.out <CR>


"Below is the minimum key mappings.
set splitright
    nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
    nnoremap <leader>l :call ToggleLocationList()<CR>

"Some optional key mappings to search directly.
   " s: Find this C symbol
    " g: Find this definition
    " d: Find functions called by this function
    " c: Find functions calling this function
    " t: Find this text string
    " e: Find this egrep pattern
    " f: Find this file
    " i: Find files #including this file

let g:deoplete#sources#jedi#python_path = 'python3'
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_smart_case = 1
let g:loaded_python3_provider = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""
set wildmode=longest:list,full
set wildmenu

""
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"let g:ycm_min_num_of_chars_for_completion=1
"let g:ycm_autoclose_preview_window_after_completion = 1 
"nnoremap <F3>           :YcmForceCompileAndDiagnostics<CR>
"nnoremap <leader>gic    :YcmCompleter GoToInclude<CR>
"nnoremap <leader>gdc    :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gdf    :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gip    :YcmCompleter GoToImprecise<CR>
"nnoremap <leader>f      :YcmCompleter FixIt<CR>
"nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsExpandTrigger = '<C-y>'


filetype plugin indent on
syntax enable

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

""
"autocompletion with ctrl+space
inoremap <c-space> <c-n>
inoremap <Nul> <c-n>


" map cut & paste to what they bloody should be
vnoremap <C-c> "+y
vnoremap <C-x> "+x
map <C-v> "+gP

set bs=2


""
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

let &path.="src/include,/usr/include/AL,"


set statusline=%<%f%h%m%r%=char=%b=0x%B\ \ %l,%c%V\ %P
set laststatus=2
set highlight+=s:MyStatusLineHighlight
highlight MyStatusLineHighlight ctermbg=black ctermfg=blue

"set makeprg=make
"nnoremap <F4> :make!<cr>

"au BufEnter *.cpp set makeprg=g++\ -g\ %\ -o\ %< 
"au BufEnter *.c set makeprg=gcc\ -g\ %\ -o\ %< 
"au BufEnter *.py set makeprg=python\ % 
"au BufEnter *.[rR] set makeprg=Rscript\ %
"map <F5> :call CompileGcc()<CR>
"func! CompileGcc()
"    exec "w" 
"    silent make
"endfunc
"
map <f9> :!~/.vim/scripts/ctags_with_dep.sh %:p:h/*.[ch] <cr><cr> :set tags=./tags,tags<cr>  :!~/.vim/scripts/cscope_find.sh <CR> :cs add cscope.out <CR> 
map <F3> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" LaTeX
function! TEXSET()
  set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ pdfcslatex\ -file-line-error-style\ %;fi;fi
  set errorformat=%f:%l:\ %m
endfunction

" C
function! CSET()
  map <F4> :w <CR> :make % <CR><CR>
  set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ gcc\ -O2\ -g\ -Wall\ -W\ -lm\ -o\ %<\ %;fi;fi
"  set errorformat=%f:%l:\ %m

  set cindent
  set tw=0
  set nowrap
endfunction

" C++
function! CPPSET()
  map <F4> :!g++ -O2 -Wall % && ./a.out
  set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ g++\ -O2\ -g\ -Wall\ -W\ -o%.bin\ %;fi;fi
  set cindent
  set tw=0
  set nowrap
endfunction

" Java
function! JAVASET()
  set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ javac\ -g\ %;fi;fi
  set errorformat=%f:%l:\ %m
  set cindent
  set tw=0
  set nowrap
endfunction

" Pascal
function! PPSET()
  set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ fpc\ -g\ -O2\ -o\%.bin\ %;fi;fi
  set errorformat=%f:%l:\ %m
  set tw=0
  set nowrap
endfunction

" vim scripts
function! VIMSET()
  set tw=0
  set nowrap
  set comments+=b:\"
endfunction

" Makefile
function! MAKEFILESET()
  set tw=0
  set nowrap
  " in a Makefile we need to use <Tab> to actually produce tabs
  set noet
  set sts=8
  iunmap <Tab>
endfunction

" HTML/PHP
function! HTMLSET()
  set tw=0
  set nowrap
endfunction

" Python
function! PYSET()
  map <F4> :!python %
  set tw=0
  set nowrap
endfunction

" Perl
function! PERLSET()
  map <F4> :!perl %
  set cindent
  set tw=0
  set nowrap
endfunction

" Autocommands for all languages:
autocmd FileType vim    call VIMSET()
autocmd FileType c      call CSET()
autocmd FileType C      call CPPSET()
autocmd FileType cc     call CPPSET()
autocmd FileType cpp    call CPPSET()
autocmd FileType java   call JAVASET()
autocmd FileType tex    call TEXSET()
autocmd FileType pascal call PPSET()
autocmd FileType make   call MAKEFILESET()
autocmd FileType html   call HTMLSET()
autocmd FileType php    call HTMLSET()
autocmd FileType perl   call PERLSET()
autocmd FileType python call PYSET()




set nu
set autoindent 
set hlsearch
set incsearch
scriptencoding utf-8
set langmap=йqцwуeкrеtнyгuшiщoзpх[ъ]фaыsвdаfпgрhоjлkдlж\\;э'
\яzчxсcмvиbтnьmб\\,ю.ЙQЦWУEКRЕTНYГUШIЩOЗPХ{Ъ}
\ФAЫSВDАFПGРHОJЛKДLЖ:Э\\"ЯZЧXСCМVИBТNЬMБ<Ю>ё`Ё~№# 
" Включаем фолдинг (сворачивание участков кода)
set foldenable

" Сворачивание по отступам
set fdm=syntax 
" Автоматическое открытие сверток при заходе в них
set foldopen=all 
set autowrite


" Автоматическое закрытие скобок
imap [ []<LEFT>
imap ( ()<LEFT>
imap { {}<LEFT>

set exrc
set secure
