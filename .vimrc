scriptencoding utf-8

let s:is_win = has('win32') || has('win64')
let s:is_unix = has('unix')
"let s:is_mac...  I'm not a Mac user.

" shell
if s:is_win 
    set shell=/bin/zsh.exe
    set shellcmdflag=-c 
    set csprg=cswrapper
    " w3m vim
    let g:w3m#command = '/bin/w3m.exe'
    let g:w3m#wget_command = '/bin/wget.exe'
    "let g:w3m#external_browser = '/chrome'
endif

if has("gui_running") 
endif

" neobundle {{{
set nocompatible
filetype off
filetype plugin indent off

if 0 | endif

if has('vim_starting')
    if &compatible
        set nocompatible
    endif

    set runtimepath+=~/.vim/after
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" let g:neobundle#types#git#default_protocol = 'http'
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" plugins {{{
NeoBundle 'Shougo/vinarise'
" NeoBundle 'scrooloose/syntastic'
" NeoBundle 'scrooloose/snipmate-snppets'
" NeoBundle 'vim-scripts/errormarker.vim'
NeoBundle 'Shougo/neocomplete'
" NeoBundle 'Sixeight/unite-grep'
" NeoBundle 'dannyob/quickfixstatus'
NeoBundle 'tyru/eskk.vim'
NeoBundle 'vim-scripts/CCTree'
" NeoBundle 'vim-scripts/Color-Sampler-Pack'
" NeoBundle 'vim-scripts/SrcExpl'
" NeoBundle 'vim-scripts/c.vim'
" NeoBundle 'vim-scripts/cscope.vim'
NeoBundle 'JuliaLang/julia-vim'
" NeoBundle 'Shougo/neocomplcache'
" NeoBundle 'Shougo/neocomplcache-clang_complete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-build'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'linux' : 'make',
    \    },
    \ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'gregsexton/gitv'
NeoBundle 'hewes/unite-gtags'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'jceb/vim-hier'
NeoBundle 'kana/vim-grex'
" NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-tabpagecd'
NeoBundle 'kurkale6ka/vim-sequence'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'shemerey/vim-project'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'thinca/vim-fontzoom'
" NeoBundle 'thinca/vim-localrc'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
" NeoBundle 'tsaleh/vim-align'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'vim-scripts/C-fold'
NeoBundle 'vim-scripts/DoxygenToolkit.vim'
NeoBundle 'vim-scripts/DrawIt'
NeoBundle 'vim-scripts/TagHighlight'
" NeoBundle 'vim-scripts/doxygen-support.vim'
NeoBundle 'vim-scripts/gtags.vim'
NeoBundle 'vim-scripts/ifdef-highlighting'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'yuratomo/w3m.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 't9md/vim-choosewin'
NeoBundle 'tacroe/unite-mark'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'osyo-manga/unite-fold'
" NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'sgur/unite-qf'
NeoBundle 'hrsh7th/vim-unite-vcs'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'kana/vim-submode'
" NeoBundle 'fuenor/im_control.vim'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'mattn/learn-vimscript'
NeoBundle 'matze/vim-tex-fold'
NeoBundle 'benekastah/neomake'
NeoBundle 'zyedidia/julialint.vim'
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'lervag/vimtex'
NeoBundle 'ujihisa/neco-look'
"}}}

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

if !has('vim_starting')
    " Call on_source hook when reloading .vimrc.
    call neobundle#call_hook('on_source')
endif
"}}}

set path+='~/usr/local/include','/usr/include','/usr/local/include'

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.tex = '\v\\\a*cite\a*\{([^}]*,)?''}'
let g:neocomplete#sources#omni#input_patterns.tex = '\v\\\a*(ref|cite)\a*([^]]*\])?\{(|[^}]*,)'

if !exists('g:neocomplete#text_mode_filetypes')
    let g:neocomplete#text_mode_filetypes = {}
endif
let g:neocomplete#text_mode_filetypes = {
            \ 'rst': 1,
            \ 'markdown': 1,
            \ 'gitrebase': 1,
            \ 'gitcommit': 1,
            \ 'vcs-commit': 1,
            \ 'hybrid': 1,
            \ 'text': 1,
            \ 'help': 1,
            \ 'tex': 1,
            \ }


" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>""

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" neosnippet
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = [
    \$HOME.'/.vim/snippets',
    \$HOME.'/.vim/bundle/neosnippet-snippets/neosnippets',
    \$HOME.'/.vim/bundle/vim-snippets/snippets',
    \]

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
let g:quickrun_config = {}

let g:quickrun_config._ = {
            \ 'runner': 'vimproc',
            \ 'runner/vimproc/updatetime' : 10,
            \ 'outputter/buffer/split': ':botright 8sp'
            \ }
let g:quickrun_config['tex'] = {
            \ 'command' : 'latexmk',
            \ 'outputter/buffer/error' : 'quickfix',
            \ 'outputter/buffer/split': 'vertical',
            \ 'cmdopt': '-pvc',
            \ 'exec' : ['%c %s']
            \ }
let g:quickrun_config['jl'] = {
            \ 'command' : 'julia',
            \ 'cmdopt': '',
            \ 'exec' : ['%c %s']
            \ }
" \ 'outputter' : 'error',
set splitbelow
set splitright


" project
"
let g:proj_flags ="imstc"


"
" key bind
"
" nmap <silent> <leader>r :QuickRun -outputter quickfix<CR>
nmap <silent> <leader>r :QuickRun<CR>
nnoremap <silent> <F6> :Project<CR>
nnoremap <silent> <F7> :YRShow<CR>
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)
"nmap <Space>m <Plug>(quickhl-toggle)
"xmap <Space>m <Plug>(quickhl-toggle)
"nmap <Space>M <Plug>(quickhl-reset)
"xmap <Space>M <Plug>(quickhl-reset)
"nmap <Space>j <Plug>(quickhl-match)
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
nnoremap / /\v
nnoremap Q <Nop> " disable ex mode keymap
noremap <S-h> ^
noremap <S-l> $

" nerdcommenter
let NERDSpaceDelims = 1

" move screen down
noremap <Space>j <C-f>
" move screen up
noremap <Space>k <C-b>

" show file list of current directory
"noremap <C-u><C-f> :UniteWithCurrentDir -buffer-name=files file<CR>
"noremap <C-u><C-f> :VimFilerExplorer<CR>
noremap <C-u><C-f> :VimFilerBufferDir -split -simple -winwidth=30 -no-quit<CR>

" show recently used file list
noremap <C-u><C-r> :Unite file_mru<CR>

" show register list
" noremap <C-u><C-y> :Unite -buffer-name=register register<CR>
noremap <C-u><C-y> :Unite yankround<CR>

" show buffer list
noremap <C-u><C-h> :Unite buffer<CR>

" show bookmark list
noremap <C-u><C-v> :Unite bookmark<CR>

" resume
noremap <C-u><C-e> :Unite resume<CR>

" unite-grep
noremap <C-u><C-g> :Unite -buffer-name=unite_grep grep::: -no-quit<CR>
let g:unite_source_grep_max_candidates = 50000

nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>


" unite-outline
noremap <C-u><C-o> :Unite outline<CR>

" unite-mark
noremap <C-u><C-m> :Unite -buffer-name=unite_mark mark<CR>

" neomake
noremap <C-u><C-l> :Neomake<CR>


" custom unite action
call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
let g:vimfiler_as_default_explorer = 1

" Set "-no-quit" automatically in grep unite source.
call unite#custom#profile('source/grep', 'context',
            \ {'no_quit' : 1})

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
set cursorcolumn

" swap
set noswapfile
set nobackup

" grep
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
if executable('ag')
    set grepprg=ag
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('jvgrep')
    set grepprg=jvgrep
    let g:unite_source_grep_command = 'jvgrep'
    let g:unite_source_grep_default_opts = "--exclude '\.(git|svn|hg|bzr|metadata|neocomplcache)'"
    let g:unite_source_grep_recursive_opt = '-R'
endif


augroup highligntJpSpace
    autocmd!
    autocmd Colorscheme * highlight JpSpace term=underline ctermbg=DarkGreen guibg=DarkGray
    autocmd! VimEnter,WinEnter * match JpSpace /　/
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

nmap <C-\>t :Gtags -t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>s :Gtags -s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :Gtags -g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>r :Gtags -r <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :Gtags -f %<CR>
nmap <C-\>d :CCTreeTraceForward <C-R>=expand("<cword>")<CR><CR>


" " add cscope.out automatically
" function! LoadCscope()
"     let db = findfile("cscope.out",".;")
"     if(!empty(db))
"         let path = strpart(db, 0, match(db, "cscope.out") - 1)
"         "echomsg "cs add " . db . " " . path 
"         set nocscopeverbose " suppress 'duplicate connection' error
"         exe "cs add " . db . " " . path
"         set cscopeverbose
"     endif
" endfunction
" au BufEnter * call LoadCscope()

" rooter
let g:rooter_manual_only = 1
let g:rooter_patterns = ['.latexmkrc','GTAGS','tags','cscope.out','.git/']
let g:rooter_use_lcd = 1

" syntastic
" let g:syntastic_auto_loc_list = 0 
" let g:syntastic_enable_signs = 1
" let g:syntastic_enable_highlighting = 0
" let g:syntastic_c_check_header = 1

" w3m vim
"let g:w3m#search_engine = 'http://www.google.co.jp/search?hl=ja&lr=lang_ja&q=' 
"
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

" vim-choosewin
nmap - <Plug>(choosewin)

" lightline
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component': {
    \   'readonly': '%{&filetype=="help"?"":&readonly?"\u2b64":""}',
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
    \   'fugitive': '%{exists("*fugitive#head")&& strlen(fugitive#head())?"\u2b60 ".fugitive#head():""}'
    \ },
    \ 'component_visible_condition': {
    \   'readonly': '(&filetype!="help"&& &readonly)',
    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
    \   'fugitive': '(exists("*fugitive#head") && strlen(fugitive#head()))'
    \ },
    \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
    \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
    \ }

set laststatus=2

" quickhl
" let g:quickhl_manual_colors = [
" \ "gui=bold ctermfg=16  ctermbg=153 guifg=#ffffff guibg=#0a7383",
" \ ]

" submode
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')

" marching-vim
let g:marching_enable_neocomplete = 1
let g:marching_clang_command = '/usr/bin/clang'
let g:marching_include_paths = [
            \ $HOME."/usr/local/include/eigen3",
            \ "/usr/include/boost"
            \]

" japanese ime
let IM_CtrlIBusPython = 1
let g:IM_CtrlBufLocalMode = 1

" disable tex conceal
let g:tex_conceal = ""

" tex-folds
let g:tex_fold_override_foldtext = 1

" yankround
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 50
let g:yankround_use_region_hl = 1
autocmd ColorScheme *   call s:define_region_hl()
function! s:define_region_hl()
    highlight default YankRoundRegion   guibg=DarkGreen ctermbg=DarkGreen term=reverse
endfunction

if has('nvim')
    set rtp+=$HOME."/.julia/v0.4/Neovim"
    " neomake
    autocmd! BufWritePost * Neomake
endif

set backspace=indent,eol,start
" set foldmethod=syntax
set foldlevel=1
set foldnestmax=2
set shellslash
set switchbuf=usetab
set expandtab
set tabstop=4
set shiftwidth=4
set noerrorbells
set vb t_vb=

syntax on
autocmd ColorScheme * highlight SpellBad term=bold ctermfg=15 ctermbg=203 guifg=#353535 guibg=#e5786d
colorscheme wombat256mod
filetype plugin on


" vim:set foldmethod=marker:
