let s:is_win = has('win32') || has('win64')
let s:is_unix = has('unix')


" shell
if s:is_win 
	set shell=c:\\cygwin\\bin\\zsh.exe
	set shellcmdflag=-c 
	set csprg=cswrapper
	" w3m vim
	let g:w3m#command = 'C:\\cygwin\\bin\\w3m.exe'
	let g:w3m#wget_command = 'C:\\cygwin\\usr\\bin\\wget.exe' 
	let g:w3m#external_browser = 'C:\\Users\\YK35943\\AppData\\Local\\Google\\Chrome\\Application\\chrome.exe'
	"set shell=zsh.exe
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
	let g:neobundle#types#git#default_protocol = 'http'
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
let g:neobundle#types#git#default_protocol = 'http'
" NeoBundle 'Shougo/vinarise'
" NeoBundle 'scrooloose/syntastic'
" NeoBundle 'vim-scripts/errormarker.vim'
"NeoBundle 'Shougo/neocomplete'
"NeoBundle 'Sixeight/unite-grep'
"NeoBundle 'dannyob/quickfixstatus'
"NeoBundle 'gregsexton/VimCalc'
"NeoBundle 'tyru/skk.vim'
"NeoBundle 'vim-scripts/CCTree'
"NeoBundle 'vim-scripts/Color-Sampler-Pack'
"NeoBundle 'vim-scripts/SrcExpl'
"NeoBundle 'vim-scripts/c.vim'
"NeoBundle 'vim-scripts/cscope.vim'
NeoBundle 'JuliaLang/julia-vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-clang_complete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite-build'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'gregsexton/gitv'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'hewes/unite-gtags'
NeoBundle 'hewes/unite-gtags'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'jceb/vim-hier'
NeoBundle 'kana/vim-grex'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-tabpagecd'
NeoBundle 'kurkale6ka/vim-sequence'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'shemerey/vim-project'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'thinca/vim-fontzoom'
"NeoBundle 'thinca/vim-localrc'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tsaleh/vim-align'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'vim-scripts/C-fold'
NeoBundle 'vim-scripts/DoxygenToolkit.vim'
NeoBundle 'vim-scripts/DrawIt'
NeoBundle 'vim-scripts/TagHighlight'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'vim-scripts/doxygen-support.vim'
NeoBundle 'vim-scripts/gtags.vim'
NeoBundle 'vim-scripts/ifdef-highlighting'
NeoBundle 'vim-scripts/quickhl.vim'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'yuratomo/w3m.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'LeafCage/yankround.vim'

filetype plugin indent on




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
"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
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
			\ 'c' : 'C:\WindRiver\vxworks-6.8\target\h,C:\WindRiver\vxworks-6.8\target\h\wrn\coreip',
			\}

" For snippet_complete marker.
if has('conceal')
	set conceallevel=2 concealcursor=i
endif

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


" project
"
let g:proj_flags ="imstc"

"
" YankRing
"
let g:yankring_history_dir = expand('$HOME')
let g:yankring_history_file = '.yankring_history'
let g:yankring_max_history = 30
let g:yankring_window_height = 13

"
" key bind
"
nmap <silent> <leader>r :QuickRun -outputter my_outputter<CR>
nnoremap <silent> <F6> :Project<CR>
nnoremap <silent> <F7> :YRShow<CR>
nmap <Space>m <Plug>(quickhl-toggle)
xmap <Space>m <Plug>(quickhl-toggle)
nmap <Space>M <Plug>(quickhl-reset)
xmap <Space>M <Plug>(quickhl-reset)
nmap <Space>j <Plug>(quickhl-match)
nnoremap <C-t> <Nop>
nnoremap <C-t>n :<C-u>tabnew<CR>
nnoremap <C-t>q :<C-u>tabclose<CR>
nnoremap <C-t>o :<C-u>tabonly<CR>
map <C-Tab> :tabn<CR>
map <S-Tab> :tabp<CR>
nnoremap t  <Nop>
nnoremap tt <C-]>         
nnoremap tj :<C-u>tag<CR> 
nnoremap tk :<C-u>pop<CR> 
nnoremap tl :<C-u>tags<CR>  
map <C-j> :cn<CR>
map <C-k> :cp<CR>
map <C-g> :Gtags 


" move screen down
noremap <Space>j <C-f>
" move screen up
noremap <Space>k <C-b>

" show file list of current directory
"noremap <C-u><C-f> :UniteWithCurrentDir -buffer-name=files file<CR>
"noremap <C-u><C-f> :VimFilerExplorer<CR>
noremap <C-u><C-f> :VimFiler -split -simple -winwidth=30 -no-quit<CR>

" show recently used file list
noremap <C-u><C-r> :Unite file_mru<CR>

" show register list
noremap <C-u><C-y> :Unite -buffer-name=register register<CR>

" show buffer list
noremap <C-u><C-b> :Unite buffer<CR>

" show bookmark list
noremap <C-u><C-v> :Unite bookmark<CR>

" unite-grep
noremap <C-u><C-g> :Unite -buffer-name=unitegrep grep:::<CR>
noremap <C-u><C-p> :UniteResume<CR>

" custom unite action
call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
let g:vimfiler_as_default_explorer = 1

" 
" command
"
command! ReloadVimrc source $MYVIMRC


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
set cursorline

" swap
set noswapfile
set nobackup

" grep
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
" if executable('ag')
" 	set grepprg=ag
" 	let g:unite_source_grep_command = 'ag'
" 	let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
" 	let g:unite_source_grep_recursive_opt = ''
" elseif executable('jvgrep')
if executable('jvgrep')
	set grepprg=jvgrep
	let g:unite_source_grep_command = 'jvgrep'
	let g:unite_source_grep_default_opts = "--exclude '\.(git|svn|hg|bzr|metadata)'"
	let g:unite_source_grep_recursive_opt = '-R'
endif

scriptencoding utf-8

augroup highligntJpSpace
	autocmd!
	autocmd Colorscheme * highlight JpSpace term=underline ctermbg=DarkGreen guibg=DarkGray
	autocmd! VimEnter,WinEnter * match JpSpace /Å@/
augroup END

" cscope
" set cscopetag
" set cscopetagorder=1
" set cscopequickfix=s-,c-,d-,i-,t-,e-
" nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-]> :Gtags <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>s :Gtags <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :Gtags -g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :Gtags -r <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :Gtags -f %<CR>


" " add cscope.out automatically
" function! LoadCscope()
" 	let db = findfile("cscope.out",".;")
" 	if(!empty(db))
" 		let path = strpart(db, 0, match(db, "cscope.out") - 1)
" 		"echomsg "cs add " . db . " " . path 
" 		set nocscopeverbose " suppress 'duplicate connection' error
" 		exe "cs add " . db . " " . path
" 		set cscopeverbose
" 	endif
" endfunction
" au BufEnter * call LoadCscope()

" rooter
let g:rooter_patterns = ['GTAGS','tags','.git/','cscope.out']
let g:rooter_use_lcd = 1

" syntastic
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_enable_signs = 1
" let g:syntastic_enable_highlighting = 1
" let g:syntastic_c_check_header = 1

" w3m vim
"let g:w3m#search_engine = 'http://www.google.co.jp/search?hl=ja&lr=lang_ja&q=' 

" vinarize
let g:vinarise_enable_auto_detect = 1

" vim-multiple-cursol
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" Map start key separately from next key
let g:multi_cursor_start_key='<F6>'

" lightline
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'mode_map': {'c': 'NORMAL'},
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
			\ },
			\ 'component_function': {
			\   'modified': 'MyModified',
			\   'readonly': 'MyReadonly',
			\   'fugitive': 'MyFugitive',
			\   'filename': 'MyFilename',
			\   'fileformat': 'MyFileformat',
			\   'filetype': 'MyFiletype',
			\   'fileencoding': 'MyFileencoding',
			\   'mode': 'MyMode'
			\ }
			\ }

function! MyModified()
	return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
	return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
	return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
				\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
				\  &ft == 'unite' ? unite#get_status_string() :
				\  &ft == 'vimshell' ? vimshell#get_status_string() :
				\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
				\ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
	try
		if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
			return fugitive#head()                                                                                                                                                                                                 
		endif
	catch
	endtry
	return ''
endfunction

function! MyFileformat()
	return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
	return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
	return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
	return winwidth('.') > 60 ? lightline#mode() : ''
endfunction
set laststatus=2

" QFixHowm
let QFixHowm_ST = 3 
let QFixHowm_SchedulePreview = 0
let howm_dir = '~/.howm'
let QFixHowm_ScheduleSearchDir = '~/.howm/schedule'
let QFixHowm_MenuPreviewEnable = 0
let QFix_PreviewEnable = 0

set foldmethod=syntax
set foldlevel=1
set foldnestmax=2
set shellslash
set switchbuf=usetab
syntax on
colorscheme gentooish


