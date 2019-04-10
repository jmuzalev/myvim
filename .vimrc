let  g:C_UseTool_cmake    = 'yes'
let  g:C_UseTool_doxygen = 'yes' 

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
    let g:deoplete#sources#clang#libclang_path = '/usr/lib/'
    let g:deoplete#sources#clang#std#c = 'gcc'
    let g:deoplete#sources#clang#clang_header = '/usr/include/'

      Plug 'sirver/ultisnips'
"    let g:UltiSnipsJumpForwardTrigger="<c-j>"
"    let g:UltiSnipsExpandTrigger="<c-j>"
"    let g:UltiSnipsEditSplit="vertical"
"	let g:UltiSnipsListSnippets="<c-e>"
     Plug 'honza/vim-snippets'

"
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

" YCM
"Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }

" Initialize plugin system
call plug#end()

let g:cscope_preload_path="/usr/include/cscope.out;/usr/local/include/cscope.out;/root/workspace/Cproj/cscope.out"
set cscopeverbose 
set cscopequickfix=s-,c-,d-,i-,t-,e-

function! Addlibcscope()
	cs add /usr/include/cscope.out<CR>
	cs add /usr/local/include/cscope.out<CR>
endfunction
nmap <F3>  :cs add /usr/include/cscope.out <CR> :cs add /usr/local/include/cscope.out <CR>


"Below is the minimum key mappings.

    nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
    nnoremap <leader>l :call ToggleLocationList()<CR>

"Some optional key mappings to search directly.
	nmap <C-Space><C-Space>s
		\:vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>g
		\:vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>c
		\:vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>t
		\:vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>e
		\:vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>i
		\:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-Space><C-Space>d
		\:vert scs find d <C-R>=expand("<cword>")<CR><CR>    



	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	
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

set makeprg=make
nnoremap <F4> :make!<cr>
map <f9> :!ctags -R --exclude=.git .<cr>

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

" Автоматическое закрытие скобок
imap [ []<LEFT>
imap ( ()<LEFT>
imap { {}<LEFT>


set exrc
set secure
