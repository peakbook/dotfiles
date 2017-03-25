call plug#begin('~/.vim/plugged')

Plug 'JuliaEditorSupport/julia-vim'
Plug 'JuliaEditorSupport/deoplete-julia'
Plug 'LeafCage/yankround.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/unite-build'
Plug 'Shougo/unite-outline'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/vimproc'
Plug 'Shougo/vimshell'
Plug 'Shougo/vinarise'
Plug 'airblade/vim-rooter'
Plug 'benekastah/neomake'
Plug 'chrisbra/csv.vim'
Plug 'flazz/vim-colorschemes'
Plug 'gregsexton/gitv'
Plug 'h1mesuke/vim-alignta'
Plug 'hewes/unite-gtags'
Plug 'honza/vim-snippets'
Plug 'hrsh7th/vim-unite-vcs'
Plug 'itchyny/calendar.vim'
Plug 'itchyny/lightline.vim'
Plug 'jceb/vim-hier'
Plug 'kana/vim-grex'
Plug 'kana/vim-submode'
Plug 'kana/vim-tabpagecd'
Plug 'kurkale6ka/vim-sequence'
Plug 'lervag/vimtex'
Plug 'mattn/learn-vimscript'
Plug 'matze/vim-tex-fold'
Plug 'osyo-manga/unite-fold'
Plug 'osyo-manga/vim-over'
Plug 'rhysd/vim-grammarous'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'sgur/unite-qf'
Plug 'shemerey/vim-project'
Plug 't9md/vim-choosewin'
Plug 't9md/vim-quickhl'
Plug 'tacroe/unite-mark'
Plug 'terryma/vim-multiple-cursors'
Plug 'thinca/vim-fontzoom'
Plug 'thinca/vim-qfreplace'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tsukkee/unite-help'
Plug 'tsukkee/unite-tag'
Plug 'ujihisa/neco-look'
Plug 'ujihisa/unite-colorscheme'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-scripts/DrawIt'
Plug 'vim-scripts/TagHighlight'
Plug 'vim-scripts/gtags.vim'
Plug 'vim-scripts/ifdef-highlighting'
Plug 'vim-scripts/taglist.vim'
Plug 'yuratomo/w3m.vim'
Plug 'zyedidia/julialint.vim'
Plug 'jpalardy/vim-slime'
Plug 'airblade/vim-gitgutter'

call plug#end()

" deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}

" neosnippet {{{
" key-mappings.
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

" others
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = [
    \$HOME.'/.vim/snippets',
    \$HOME.'/.vim/bundle/neosnippet-snippets/neosnippets',
    \$HOME.'/.vim/bundle/vim-snippets/snippets',
    \]
" }}}


" taglist
nnoremap <silent> <F8> :TlistToggle<CR>


" quickfix
augroup quickfixopen
    autocmd!
    autocmd QuickFixCmdPost make,vimgrep cw
augroup END


" quickrun {{{
nmap <silent> <leader>r :QuickRun<CR>

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
" }}}


" project
"
let g:proj_flags ="imstc"


" leader 
let mapleader = "\<Space>"

" project
nnoremap <silent> <F6> :Project<CR>

" quickhl {{{
nmap <leader>m <Plug>(quickhl-manual-this)
xmap <leader>m <Plug>(quickhl-manual-this)
nmap <leader>M <Plug>(quickhl-manual-reset)
xmap <leader>M <Plug>(quickhl-manual-reset)
nmap <leader>j <Plug>(quickhl-cword-toggle)
nmap <leader>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)
" }}}

" tab operations {{{
nnoremap <leader>t <Nop>
nnoremap <leader>tn :<C-u>tabnew<CR>
nnoremap <leader>tq :<C-u>tabclose<CR>
nnoremap <leader>to :<C-u>tabonly<CR>
map <C-Tab> :tabn<CR>
map <S-Tab> :tabp<CR>
" }}}

nnoremap t  <Nop>
nnoremap tt <C-]>         
nnoremap tj :<C-u>tag<CR> 
nnoremap tk :<C-u>pop<CR> 
nnoremap tl :<C-u>tags<CR>  
map <C-j> :cn<CR>
map <C-k> :cp<CR>
nnoremap / /\v
noremap <S-h> ^
noremap <S-l> $

" avoid annoying {{{
nnoremap Q <Nop>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
" }}}

" screen up/down {{{
noremap <Space>j <C-f>
noremap <Space>k <C-b>
" }}}

" terminal escape
tnoremap <silent> <C-[><C-n> <C-\><C-n>


" unite {{{
"
" custom unite action
call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
let g:vimfiler_as_default_explorer = 1

" show file list of current directory
"noremap <C-u><C-f> :UniteWithCurrentDir -buffer-name=files file<CR>
"noremap <C-u><C-f> :VimFilerExplorer<CR>
noremap <C-u><C-f> :VimFilerBufferDir -split -simple -winwidth=30 -no-quit<CR>

" show recently used file list
noremap <C-u><C-r> :Unite file_mru<CR>

" show register list
" noremap <C-u><C-y> :Unite -buffer-name=register register<CR>
noremap <C-u><C-y> :Unite history/yank -default-action=append<CR>

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

" }}}
"

" neomake
noremap <C-u><C-l> :Neomake<CR>

" vp doesn't replace paste buffer {{{
function! RestoreRegister()
    let @" = s:restore_reg
    return ''
endfunction
function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
" }}}

" Set "-no-quit" automatically in grep unite source.
call unite#custom#profile('source/grep', 'context',
            \ {'no_quit' : 1})

" my commands
command! ReloadVimrc source $MYVIMRC


" grep command {{{
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
" }}}


" zenkaku space highlight {{{
augroup highligntJpSpace
    autocmd!
    autocmd Colorscheme * highlight JpSpace term=underline ctermbg=DarkGreen guibg=DarkGray
    autocmd! VimEnter,WinEnter * match JpSpace /　/
augroup END
" }}}


" gtags {{{
nmap <leader>g <Nop>
nmap <leader>gt :Gtags -t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gs :Gtags -s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gg :Gtags -g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gr :Gtags -r <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gf :Gtags -f %<CR>
nmap <leader>gd :CCTreeTraceForward <C-R>=expand("<cword>")<CR><CR>
map <C-g> :Gtags 
" }}}


" nerdcommenter
let NERDSpaceDelims = 1


" rooter {{{
let g:rooter_manual_only = 1
let g:rooter_patterns = ['.latexmkrc','GTAGS','tags','cscope.out','.git/']
let g:rooter_use_lcd = 1
" }}}


" syntastic {{{
let g:syntastic_auto_loc_list = 0 
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 0
let g:syntastic_c_check_header = 1
let g:sytnastic_check_on_wq = 0
let g:sytnastic_check_on_open = 1
" }}}

" w3m vim
"let g:w3m#search_engine = 'http://www.google.co.jp/search?hl=ja&lr=lang_ja&q=' 


" vinarize
let g:vinarise_enable_auto_detect = 1

" vim-multiple-cursol {{{
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" Map start key separately from next key
let g:multi_cursor_start_key='<F6>'
" }}}


" vim-choosewin
nmap - <Plug>(choosewin)


" lightline {{{
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo', 'percent'], [ 'fileformat', 'fileencoding', 'filetype', 'syntastic'] ]
    \ },
    \ 'component_expand': {
    \   'syntastic': 'SyntasticStatuslineFlag',
    \ },
    \ 'component_type': {
    \   'syntastic': 'error',
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
augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.c,*.cpp,*.py call s:syntastic()
augroup END
function! s:syntastic()
    SyntasticCheck
    call lightline#update()
endfunction
" }}}


" quickhl
" let g:quickhl_manual_colors = [
" \ "gui=bold ctermfg=16  ctermbg=153 guifg=#ffffff guibg=#0a7383",
" \ ]


" submode {{{
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')
" }}}


" japanese ime
let IM_CtrlIBusPython = 1
let g:IM_CtrlBufLocalMode = 1

" disable tex conceal
let g:tex_conceal = ""

" tex-folds
let g:tex_fold_override_foldtext = 1


" yankround {{{
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
" }}}


" grammarous {{{
let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs)
    nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
endfunction

function! g:grammarous#hooks.on_reset(errs)
    nunmap <buffer><C-n>
    nunmap <buffer><C-p>
endfunction
" }}}


" vimtex
let g:vimtex_view_method='zathura'

" vimslime
let g:slime_target = "tmux"
xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c><c-c> <Plug>SlimeParagraphSend
nmap <c-c>v     <Plug>SlimeConfig
if exists('$TMUX')
    let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.1"}
endif

" julia-vim
let g:latex_to_unicode_tab = 0


" vim-gutguitter
let g:gitgutter_highlight_lines = 1
nmap <leader>hh <Plug>GitGuitterToggle

if has('nvim')
    " neomake
    autocmd! BufWritePost * Neomake
endif

" other settings {{{
" tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
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
" set cursorcolumn

" swap
set noswapfile
set nobackup

set backspace=indent,eol,start
" set foldmethod=syntax
set foldlevel=1
set foldnestmax=2
set shellslash
set switchbuf=usetab
set expandtab
set noerrorbells
set visualbell t_vb=
set noerrorbells
set ambiwidth=double
" }}}

syntax on
autocmd ColorScheme * highlight SpellBad term=bold ctermfg=15 ctermbg=203 guifg=#353535 guibg=#e5786d
colorscheme wombat256mod
filetype plugin on


" vim:set foldmethod=marker:
