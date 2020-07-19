call plug#begin('~/.vim/plugged')

Plug 'JuliaEditorSupport/julia-vim'
Plug 'LeafCage/yankround.vim'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/neocomplete.vim'
endif
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'neomake/neomake'
Plug 'Chiel92/vim-autoformat'
Plug 'cj/vim-webdevicons'
Plug 'dhruvasagar/vim-table-mode'
Plug 'flazz/vim-colorschemes'
Plug 'fszymanski/deoplete-emoji'
" Plug 'gnperdue/vim-asciidoc'
" Plug 'habamax/vim-asciidoctor'
Plug 'gregsexton/gitv'
Plug 'h1mesuke/vim-alignta'
Plug 'honza/vim-snippets'
Plug 'itchyny/calendar.vim'
Plug 'itchyny/lightline.vim'
" Plug 'jalvesaq/nvim-r'
Plug 'jceb/vim-hier'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'svermeulen/vim-easyclip'
Plug 'kana/vim-grex'
Plug 'kana/vim-submode'
Plug 'kana/vim-tabpagecd'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'lervag/vimtex'
Plug 'mattn/learn-vimscript'
Plug 'matze/vim-tex-fold'
Plug 'maverickg/stan.vim'
Plug 'maximbaz/lightline-ale'
" Plug 'ncm2/ncm2'
Plug 'osyo-manga/vim-over'
Plug 'ozelentok/denite-gtags'
Plug 'posva/vim-vue'
Plug 'rhysd/vim-grammarous'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
" Plug 'scrooloose/nerdtree'
Plug 'shemerey/vim-project'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neossh.vim'
" Plug 'Shougo/neoyank.vim'
Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'Shougo/vimshell'
Plug 't9md/vim-choosewin'
Plug 't9md/vim-quickhl'
Plug 'terryma/vim-multiple-cursors'
Plug 'thinca/vim-fontzoom'
Plug 'thinca/vim-qfreplace'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ujihisa/neco-look'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-scripts/ditaa'
Plug 'vim-scripts/DrawIt'
Plug 'vim-scripts/gtags.vim'
Plug 'vim-scripts/ifdef-highlighting'
Plug 'vim-scripts/TagHighlight'
Plug 'w0rp/ale'
Plug 'zchee/deoplete-jedi'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'zchee/deoplete-clang'
Plug 'sheerun/vim-polyglot'
Plug 'wtsnjp/vim-expl3'
Plug 'luochen1990/rainbow'
Plug 'easymotion/vim-easymotion'
" Plug 'OmniSharp/omnisharp-vim'
Plug 'SkyLeach/pudb.vim'
Plug 'majutsushi/tagbar'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'voldikss/vim-floaterm'


" Plug 'justmao945/vim-clang'
" Plug 'chrisbra/csv.vim'
" Plug 'hewes/unite-gtags'
" Plug 'hrsh7th/vim-unite-vcs'
" Plug 'JuliaEditorSupport/deoplete-julia'
" Plug 'kannokanno/previm'
" Plug 'kurkale6ka/vim-sequence'
" Plug 'osyo-manga/unite-fold'
" Plug 'ryanoasis/vim-devicons'
" Plug 'scrooloose/syntastic'
" Plug 'sgur/unite-qf'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'Shougo/unite-build'
" Plug 'Shougo/unite-outline'
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/vinarise'
" Plug 'tacroe/unite-mark'
" Plug 'tsukkee/unite-help'
" Plug 'tsukkee/unite-tag'
" Plug 'ujihisa/unite-colorscheme'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'yuratomo/w3m.vim'
" Plug 'zyedidia/julialint.vim'

call plug#end()

" deoplete {{{
if has('nvim')
    let g:deoplete#enable_at_startup = 1
else
    let g:neocomplete#enable_at_startup = 1
endif
" }}}

" neosnippet {{{
" key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

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



" quickrun {{{
nnoremap <silent> <leader>r :QuickRun<CR>

let g:quickrun_config = {}

let g:quickrun_config._ = {
            \ 'runner': 'vimproc',
            \ 'runner/vimproc/updatetime' : 10,
            \ 'outputter/buffer/split': ':botright 8sp'
            \ }
let g:quickrun_config['tex'] = {
            \ 'command' : 'llmk',
            \ 'outputter/buffer/error' : 'quickfix',
            \ 'outputter/buffer/split': 'vertical',
            \ 'cmdopt': '',
            \ 'exec' : ['%c']
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



" leader
let mapleader = "\<Space>"

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
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tq :tabclose<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>te :tabnew<CR>:terminal<CR>a
nnoremap <leader>n :tabn<CR>
nnoremap <leader>p :tabp<CR>
" }}}

noremap <C-j> :cn<CR>
noremap <C-k> :cp<CR>
nnoremap / /\v
noremap <S-h> ^
noremap <S-l> $

" avoid annoying {{{
nnoremap Q <Nop>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
" }}}

" screen up/down {{{
nnoremap <leader>j <C-f>
nnoremap <leader>k <C-b>
" }}}

" terminal escape
if has('nvim')
    tnoremap <silent><C-[><C-n> <C-\><C-n>:FloatermToggle<CR>
endif


" fzf
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path '__pycache__' -prune -o -type f -print -o -type l -print 2> /dev/null"
let $FZF_DEFAULT_OPTS='--layout=reverse  --margin=1,2'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6, 'border': 'sharp' } }

nnoremap <silent><C-u><C-b> :Buffers<CR>
nnoremap <silent><C-u><C-c> :History:<CR>
nnoremap <silent><C-u><C-g> :Ag<CR>
nnoremap <silent><C-u><C-h> :History<CR>
nnoremap <silent><C-u><C-l> :Lines<CR>
nnoremap <silent><C-u><C-m> :Marks<CR>
nnoremap <silent><C-u><C-o> :Files<CR>
nnoremap <silent><C-u><C-r> :BTags<CR>
nnoremap <silent><C-u><C-n> :Tags<CR>
nnoremap <silent><C-u><C-s> :History/<CR>
nnoremap <silent><C-u><C-w> :Windows<CR>


" my commands
command! ReloadVimrc source $MYVIMRC


" gtags {{{
" nnoremap <leader>g <Nop>
" nnoremap <leader>ga :DeniteCursorWord -buffer-name=gtags_context gtags_context<cr>
" nnoremap <leader>gd :DeniteCursorWord -buffer-name=gtags_def gtags_def<cr>
" nnoremap <leader>gr :DeniteCursorWord -buffer-name=gtags_ref gtags_ref<cr>
" nnoremap <leader>gg :DeniteCursorWord -buffer-name=gtags_grep gtags_grep<cr>
" nnoremap <leader>gf :Denite -buffer-name=gtags_file gtags_file<cr>
" nnoremap <leader>gt :Denite -buffer-name=gtags_completion gtags_completion<cr>
" nnoremap <leader>gp :Denite -buffer-name=gtags_path gtags_path<cr>
" }}}


" nerdcommenter
let NERDSpaceDelims = 1


" rooter {{{
let g:rooter_manual_only = 1
let g:rooter_patterns = ['.latexmkrc','GTAGS','tags','cscope.out','.git/']
let g:rooter_use_lcd = 1
let g:rooter_resolve_links = 1
let g:rooter_change_directory_for_non_project_files = 'current'
" }}}


" vinarize
let g:vinarise_enable_auto_detect = 1

" " vim-multiple-cursol {{{
" let g:multi_cursor_use_default_mapping=0
" let g:multi_cursor_next_key='<C-n>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'
" " Map start key separately from next key
" let g:multi_cursor_start_key='<F6>'
" " }}}


" vim-choosewin
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 1


" lightline {{{
let g:lightline = {
    \ 'colorscheme': 'default',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'modified' ],
    \             [ 'linter_checking', 'linter_warnings', 'linter_errors', 'linter_ok']],
    \   'right': [ [ 'lineinfo', 'percent'], ['filetype'] ]
    \ },
    \ 'component_expand': {
    \   'linter_checking': 'lightline#ale#checking',
    \   'linter_warnings': 'lightline#ale#warnings',
    \   'linter_errors': 'lightline#ale#errors',
    \   'linter_ok': 'lightline#ale#ok',
    \ },
    \ 'component_type': {
    \   'linter_checking': 'left',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \   'linter_ok': 'left',
    \ },
    \ 'component': {
    \   'readonly': '%{&filetype=="help"?"":&readonly?"\ue0a2":""}',
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
    \   'fugitive': '%{exists("*fugitive#head")&& strlen(fugitive#head())?"\ue0a0".fugitive#head():""}'
    \ },
    \ 'component_visible_condition': {
    \   'readonly': '(&filetype!="help"&& &readonly)',
    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
    \   'fugitive': '(exists("*fugitive#head") && strlen(fugitive#head()))'
    \ },
    \ 'component_function': {
    \   'filetype': 'MyFiletype',
    \ },
    \ 'separator': { 'left': "󾂰", 'right': "󾂲" },
    \ 'subseparator': { 'left': "󾂱", 'right': "󾂳" }
    \ }
function! MyFiletype()
  return winwidth(0) > 70 ? (WebDevIconsGetFileFormatSymbol().WebDevIconsGetFileTypeSymbol()):''
endfunction
" }}}
"


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
    highlight default YankRoundRegion guibg=DarkGreen ctermbg=DarkGreen term=reverse
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
" let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
            \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:vimtex_compiler_progname = 'nvr'

" vimslime
let g:slime_target = "tmux"
xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c><c-c> <Plug>SlimeParagraphSend
nmap <c-c>v     <Plug>SlimeConfig
if exists('$TMUX')
    let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.1"}
endif

" julia-vim
" let g:latex_to_unicode_tab = 0


" vim-gutguitter
let g:gitgutter_highlight_lines = 0
let g:gitgutter_sign_added = '➕'
let g:gitgutter_sign_modified = '🔨'
" let g:gitgutter_sign_removed = 'zz'
" let g:gitgutter_sign_removed_first_line = '^^'
" let g:gitgutter_sign_modified_removed = 'ww'

" easy-align
xmap ga <Plug>(EasyAlign)

" previm
let g:previm_open_cmd = "firefox"
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_denite = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1

" R
au BufNewFile,BufRead *.R setl ep=R\ --quiet\ -s\ -e\ 'library(styler);f=file(\"stdin\");style_text(readLines(f));close(f);'

" vimtable
nnoremap <leader>ta :TableModeToggle<CR>

" deoplete-jedi
let g:deoplete#sources#jedi#python_path = $PYBASEHOME

" julia
let g:default_julia_version = '1.4'

" language server
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
\   'vue': ['vls'],
\   'r': ['R', '--slave', '-e', 'languageserver::run()'],
\   'html': [],
\   'css': [],
\   'javascript': ['javascript-typescript-stdio'],
\   'typescript': ['javascript-typescript-stdio'],
\   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
\       using LanguageServer;
\       using Pkg;
\       import StaticLint;
\       import SymbolServer;
\       env_path = dirname(Pkg.Types.Context().env.project_file);
\       debug = false; 
\       server = LanguageServer.LanguageServerInstance(stdin, stdout, debug, env_path, "", Dict());
\       server.runlinter = true;
\       run(server);
\   ']
\ }
nnoremap <leader>l <Nop>
nnoremap <Leader>lm :call LanguageClient_contextMenu()<CR>
nnoremap <Leader>lh :call LanguageClient_textDocument_hover()<CR>
nnoremap <Leader>ld :call LanguageClient_textDocument_definition()<CR>
nnoremap <Leader>lr :call LanguageClient_textDocument_rename()<CR>
nnoremap <Leader>lf :call LanguageClient_textDocument_formatting()<CR>

autocmd FileType vue syntax sync fromstart

" ale
let g:ale_fix_on_save = 0
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['autopep8'],
\}
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
let g:ale_linters = {
\   'javascript': ['eslint', 'eslint-plugin-vue'],
\   'python': ['flake8'],
\   'tex': ['textlint'],
\   'markdown': ['textlint'],
\   'html': ['stylelint'],
\   'vue': ['eslint', 'vls'],
\   'css': ['stylelint'],
\   'json': ['textlint'],
\   'zsh': ['shell'],
\   'txt': ['textlint'],
\}
let g:ale_linter_aliases = {'html': ['html', 'javascript', 'css']}
let g:ale_set_signs = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '🔥'
let g:ale_sign_warning = "⚠️"

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"
" call deoplete#custom#option('sources', {
"     \ '_': ['ale', 'file', 'buffer'],
" \})
" \ 'r': ['LanguageClient', 'omni'],
" \ 'julia': ['LanguageClient']

" defx {{{
" let g:defx_icons_enable_syntax_highlight = 0
call defx#custom#column('icon', {
            \ 'directory_icon': '',
            \ 'mark_icon': '',
            \ 'opened_icon': '',
            \ 'root_icon': '',
            \ 'default_icon': ''
            \ })

call defx#custom#column('mark', {
            \ 'length': 2,
            \ 'readonly_icon': '🔑',
            \ 'selected_icon': '',
            \ })

call defx#custom#option('_', {
            \ 'columns': 'indent:mark:icons:filename:type:size:time',
            \ })

nnoremap <silent><C-u><C-f> :Defx<CR>
autocmd FileType defx call s:defx_my_settings()
function! AppendMRU(context) abort
    call neomru#append(a:context.targets[0])
endfunction
function! s:defx_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ defx#do_action('multi',['drop','call', 'AppendMRU'])
    nnoremap <silent><buffer><expr> e
                \ defx#do_action('multi',['drop','call', 'AppendMRU'])
    nnoremap <silent><buffer><expr> c
                \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
                \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
                \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> l
                \ defx#do_action('multi',['drop','call', 'AppendMRU'])
    nnoremap <silent><buffer><expr> E
                \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P
                \ defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> K
                \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
                \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> DD
                \ defx#do_action('remove_trash')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> x
                \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
                \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
                \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> h
                \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
                \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
                \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> o
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
                \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> t
                \ defx#do_action('open_or_close_tree')
    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
                \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
                \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
                \ defx#do_action('change_vim_cwd')
endfunction
" }}}


" vim-clang
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-6.0/lib/libclang.so.1'

" csv
let g:csv_no_conceal = 1

" rainbow
let g:rainbow_active = 1

" terminal
autocmd TermOpen * setlocal nonu

" pudb
let g:python3_host_prog=$PYBASEHOME
let g:pudb_python=$PYBASEHOME
let g:pudb_breakpoint_symbol='🔴'

function! s:yank_list()
  redir => ys
  silent Yanks
  redir END
  return split(ys, '\n')[1:]
endfunction

function! s:yank_handler(reg)
  if empty(a:reg)
    echo "aborted register paste"
  else
    let token = split(a:reg, ' ')
    execute 'Paste' . token[0]
  endif
endfunction

command! FZFYanks call fzf#run({
\ 'source': <sid>yank_list(),
\ 'sink': function('<sid>yank_handler'),
\ 'options': '-m',
\ 'down': 12,
\ 'window': { 'width': 0.8, 'height': 0.6, 'border': 'sharp' } 
\ })
nnoremap <silent><C-u><C-y> :FZFYanks<CR>

au FileType markdown setl conceallevel=0

" prettier
nnoremap <leader>fo <Plug>(Prettier)

" floaterm
highlight FloatermBorder cterm=none ctermfg=235 ctermbg=237
let g:floaterm_width=0.8
let g:floaterm_height=0.6
nnoremap <silent><C-u><C-t> :FloatermToggle<CR>
nnoremap <silent><leader>f <Nop>
nnoremap <silent><leader>ff :FloatermNew<CR>
nnoremap <silent><leader>ft :FloatermToggle<CR>
nnoremap <silent><leader>fn :FloatermNext<CR>
nnoremap <silent><leader>fp :FloatermPrev<CR>
nnoremap <silent><leader>fk :FloatermKill<CR>
nnoremap <silent><leader>fh :FloatermHide<CR>
nnoremap <silent><leader>fs :FloatermShow<CR>
command! Vifm FloatermNew vifm
nnoremap <silent><C-u><C-v> :Vifm<CR>

" other settings {{{
" tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent
set history=100

" command completion
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

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
set synmaxcol=320
set cursorcolumn
set ttyfast
set lazyredraw
" set mouse=a
" }}}


syntax on
colorscheme tigrana-256-dark
highlight clear SpellBad
highlight SpellBad ctermbg=Red cterm=bold
highlight clear ALEErrorSign
highlight ALEErrorSign cterm=bold
highlight clear SpellLocal
highlight SpellLocal cterm=none
highlight clear ALEWarningSign
highlight ALEWarningSign cterm=none

filetype plugin on

set termguicolors
" vim:set foldmethod=marker:
