let s:is_win = has('win32') || has('win64')
let s:is_unix = has('unix')


" shell
if s:is_win 
	set shell=c:\\cygwin\\bin\\zsh.exe
	"set shell=/bin/zsh.exe
	"set shell=/cygdrive/c/cygwin/bin/zsh.exe
	"set shell=c:\WINDOWS\system32\cmd.exe
endif


" neobundle
set nocompatible
filetype off
filetype plugin indent off

if has('vim_starting')
	set runtimepath+=~/.vim/after
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'git@github.com:Shougo/neobundle.vim'
NeoBundle 'git@github.com:Shougo/neocomplcache'
NeoBundle 'git@github.com:Shougo/neocomplcache-snippets-complete'
NeoBundle 'git@github.com:Shougo/neocomplcache-clang_complete'
NeoBundle 'git@github.com:Shougo/vimproc'
NeoBundle 'git@github.com:Shougo/vimshell'
NeoBundle 'git@github.com:Shougo/vimfiler'
NeoBundle 'git@github.com:Shougo/unite.vim'
NeoBundle 'git@github.com:thinca/vim-quickrun'
NeoBundle 'git@github.com:thinca/vim-localrc'
NeoBundle 'git@github.com:tsukkee/unite-tag'
NeoBundle 'git@github.com:tsukkee/unite-help'
NeoBundle 'git@github.com:tomtom/tcomment_vim'
NeoBundle 'git@github.com:vim-scripts/YankRing.vim'
NeoBundle 'git@github.com:vim-scripts/gtags.vim'
NeoBundle 'git@github.com:vim-scripts/taglist.vim'
NeoBundle 'git@github.com:vim-scripts/c.vim'
NeoBundle 'git@github.com:vim-scripts/DrawIt'
NeoBundle 'git@github.com:vim-scripts/doxygen-support.vim'
NeoBundle 'git@github.com:vim-scripts/DoxygenToolkit.vim'
NeoBundle 'git@github.com:tsaleh/vim-align'
" NeoBundle 'git@github.com:vim-scripts/errormarker.vim'
NeoBundle 'git@github.com:jceb/vim-hier'
NeoBundle 'git@github.com:dannyob/quickfixstatus'
NeoBundle 'git@github.com:shemerey/vim-project'

filetype plugin indent on


" 
" neocomplcache
"
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 0 
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ } 

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'

let g:neocomplcache_include_paths = {
	\ 'c' : 'C:\WindRiver\vxworks-6.8\target\h,C:\WindRiver\vxworks-6.8\target\h\wrn\coreip,C:\MELSEC\CCPU4\Q24DHCCPU-V\Include',
	\}
"
"add header path
"
"set path+='/usr/share/vxworks/vx68h'
"set path+='C:\WindRiver\vxworks-6.8\target\h'

"
"taglist
"
nnoremap <silent> <F8> :TlistToggle<CR>

"
" doxygen support
"
let g:Doxy_GlobalTemplateFile = $HOME.'/.vim/bundle/doxygen-support.vim/doxygen-support/templates/doxygen.templates'
let g:Doxy_LocalTemplateFile = $HOME.'/.vim/templates/doxygen-support/doxygen.templates'
let g:Doxy_LocalTemplateDirectory = $HOME.'/.vim/templates/doxygen-support/'


"
" quickfix
"
augroup quickfixopen
	autocmd!
	autocmd QuickFixCmdPost make,vimgrep cw
augroup END


" 
" quickrun
"
let g:quickrun_config = {
    \ '*': {'runmode': 'async:remote:vimproc','split':''},  
    \ }
set splitbelow
set splitright


let my_outputter = quickrun#outputter#multi#new()
let my_outputter.config.targets = ["buffer", "quickfix"]

function! my_outputter.init(session)
    " quickfix を閉じる
    :cclose
    " 元の処理を呼び出す
    call call(quickrun#outputter#multi#new().init, [a:session], self)
endfunction

function! my_outputter.finish(session)
    call call(quickrun#outputter#multi#new().finish, [a:session], self)
    " 出力バッファの削除
    bwipeout [quickrun
    " vim-hier を使用している場合は、ハイライトを更新
    :HierUpdate
    " quickfix への出力後に quickfixstatus を有効に
    :QuickfixStatusEnable
endfunction

" quickrun に outputter を登録
call quickrun#register_outputter("my_outputter", my_outputter)

" <leader>r を再定義
nmap <silent> <leader>r :QuickRun -outputter my_outputter<CR>


" project
"
let g:proj_flags ="imstc"
nnoremap <silent> <F6> :Project<CR>

"
" YankRing
"
let g:yankring_history_dir = expand('$HOME')
let g:yankring_history_file = '.yankring_history'
let g:yankring_max_history = 15
let g:yankring_window_height = 13
nnoremap <silent> <F7> :YRShow<CR>


"
" settings
"
" tab
set tabstop=4 shiftwidth=4 softtabstop=4
set smartindent
set history=100

" command completion
set wildmenu
set wildmode=list:longest,full

" search
set notagbsearch
set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch
nohlsearch

" display
set number
set showmatch
set showmode
set showcmd
set nowrap
set list
set listchars=tab:>-

" swap
set noswapfile
set nobackup

colorscheme desert


