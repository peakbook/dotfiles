let s:is_win = has('win32') || has('win64')
let s:is_unix = has('unix')


" shell
if s:is_win 
	set shell=c:\cygwin\bin\zsh.exe
endif


" neobundle
set nocompatible
filetype off
filetype plugin indent off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'https://github.com/Shougo/neobundle.vim'
NeoBundle 'https://github.com/Shougo/neocomplcache'
NeoBundle 'https://github.com/Shougo/neocomplcache-snippets-complete'
NeoBundle 'https://github.com/Shougo/vimproc'
NeoBundle 'https://github.com/Shougo/vimshell'
NeoBundle 'https://github.com/Shougo/unite.vim'
NeoBundle 'https://github.com/thinca/vim-quickrun'
NeoBundle 'https://github.com/vim-scripts/taglist.vim'
NeoBundle 'https://github.com/vim-scripts/c.vim'
NeoBundle 'https://github.com/vim-scripts/DrawIt'
NeoBundle 'https://github.com/vim-scripts/doxygen-support.vim'
NeoBundle 'https://github.com/jceb/vim-hier'
NeoBundle 'https://github.com/dannyob/quickfixstatus'

filetype plugin indent on


" 
" neocomplcache
"
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'c' : './ctags', 
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


"
" settings
"
" tab
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab
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
"set list


" swap
set noswapfile
set nobackup

colorscheme desert

