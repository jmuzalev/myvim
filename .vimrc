"let  g:C_UseTool_cmake    = 'yes'
"let  g:C_UseTool_doxygen = 'yes' 
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
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger = "<c-j>"
" по умолчанию, окно с тэгами отображается справа, что не привычно.
let g:tagbar_left = 1
Plug 'Yggdroot/indentLine'
"Plug 'thaerkh/vim-indentguides'
Plug 'vim-airline/vim-airline'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang' }


"let g:ycm_collect_identifiers_from_tags_files = 1
autocmd Filetype c let g:ycm_global_ycm_extra_conf ='~/.vim/.ycm_extra_conf.py'
autocmd Filetype cpp let g:ycm_global_ycm_extra_conf ='~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_add_preview_to_completeopt=1
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_goto_buffer_command = 'vertical-split'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'gnattishness/cscope_maps'
"Plug 'Shougo/neoinclude.vim'
Plug 'terryma/vim-multiple-cursors'

Plug 'xaizek/vim-inccomplete'

Plug 'mh21/errormarker.vim'
" Initialize plugin system
call plug#end()

let g:cscope_preload_path="/usr/include/cscope.out;/usr/local/include/cscope.out;/root/workspace/Cproj/cscope.out;getcwd()/cscope.out"
"set cscopeverbose 
set cscopequickfix=s-,c-,d-,i-,t-,e-

let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat


"Below is the minimum key mappings.
set splitright
    nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
    nnoremap <leader>l :call ToggleLocationList()<CR>
    map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>



let g:UltiSnipsExpandTrigger="<c-e>"
"let g:UltiSnipsJumpForwardTrigger="<c-e>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"


""
set wildmode=longest:list,full
set wildmenu

""
let g:ycm_min_num_of_chars_for_completion=2
nnoremap <F2>           :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>gic    :YcmCompleter GoToInclude<CR>
nnoremap <leader>gdc    :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gdf    :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gip    :YcmCompleter GoToImprecise<CR>
nnoremap <leader>f      :YcmCompleter FixIt<CR>
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>



filetype plugin indent on
syntax enable

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set smartindent
set ai
set cin


set list lcs=tab:\┊\ 
"set list listchars=tab:\┊\ ,trail:·,extends:»,precedes:«,nbsp:×
let g:indent_guides_enable_on_vim_startup=1
let g:indentLine_color_term = 250
"let g:indentLine_enabled = 2
let g:indentLine_char = '┆'
"let g:indentLine_color_term = 239
"let g:indentLine_bgcolor_term = 202
"let g:indentLine_bgcolor_gui = '#FF5F00'
"set expandtab
"set cursorcolumn
"let g:indentguides_ignorelist = ['text']
"let g:indentguides_spacechar = '┆'
"let g:indentguides_tabchar = '┊'
"set modifiable
"" convert spaces to tabs when reading file
"autocmd! bufreadpost * set noexpandtab | retab! 4

"" convert tabs to spaces before writing file
"autocmd! bufwritepre * set expandtab | retab! 4

"" convert spaces to tabs after writing file (to show guides again)
"autocmd! bufwritepost * set noexpandtab | retab! 4
"┊

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

let &path.="src/include,/usr/include/AL,./,"
set path+=/usr/include/*/*
set path+=/usr/include/glib-2.0/*

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

"set nocp
"filetype plugin on
set tags=tags,.tags,../tags
"set updatetime=1000
map <f9> :!~/.vim/scripts/ctags_with_dep.sh %:p:h/*.[ch][pp]? <cr><cr> :set tags=./tags <CR><CR> :!~/.vim/scripts/cscope_find.sh <CR> :cs add cscope.out <CR> 
map <F3> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" LaTeX
function! TEXSET()
  set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ pdfcslatex\ -file-line-error-style\ %;fi;fi
  set errorformat=%f:%l:\ %m
endfunction

" C
function! CSET()
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow
    map <F4> :w <CR> :make % <CR><CR> 
":copen <CR>
  set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ clean\ &&\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ gcc\ -O2\ -g\ -Wall\ -Wextra\ -Wno-override-init\ -lm\ -o\ %<\ %;fi;fi
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

set complete=.,w,b,t,i,u,k       " completion buffers
    "            | | | | | | |
    "            | | | | | | `-dict
    "            | | | | | `-unloaded buffers
    "            | | | | `-include files
    "            | | | `-tags
    "            | | `-other loaded buffers
    "            | `-windows buffers
    "            `-the current buffer
set completeopt=menuone " menu,menuone,longest,preview
set completeopt-=preview " dont show preview window


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
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
ino {;<CR> {<CR>};<ESC>O
imap <c-s-down> <esc>ddpi 
imap <c-s-up> <esc>ddkPi   
imap <c-s-c> <esc>yypi      

set background=dark
highlight Comment ctermfg=DarkGray
highlight SpellBad  term=reverse ctermbg=179 guifg=White guibg=Blue


set exrc
set secure
"let g:ycm_add_preview_to_completeopt = 1
let g:ycm_use_ultisnips_completer = 1
"let g:ycm_cache_omnifunc = 1
