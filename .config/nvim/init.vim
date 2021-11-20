call plug#begin('~/.vim/plugged')

Plug 'LeafCage/yankround.vim'
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc.vim'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'Shougo/ddc-around'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/deoppet.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/neosnippet-snippets'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'Shougo/ddc-nvim-lsp'
Plug 'matsui54/ddc-nvim-lsp-doc'
Plug 'matsui54/ddc-dictionary'
Plug 'shun/ddc-vim-lsp'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'neomake/neomake'
Plug 'ryanoasis/vim-devicons'
Plug 'dhruvasagar/vim-table-mode'
Plug 'flazz/vim-colorschemes'
Plug 'gregsexton/gitv'
Plug 'h1mesuke/vim-alignta'
Plug 'honza/vim-snippets'
Plug 'itchyny/calendar.vim'
Plug 'itchyny/lightline.vim'
Plug 'jceb/vim-hier'
Plug 'jpalardy/vim-slime'
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
Plug 'osyo-manga/vim-over'
Plug 'ozelentok/denite-gtags'
Plug 'posva/vim-vue'
Plug 'rhysd/vim-grammarous'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'shemerey/vim-project'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 't9md/vim-choosewin'
Plug 't9md/vim-quickhl'
Plug 'terryma/vim-multiple-cursors'
Plug 'thinca/vim-fontzoom'
Plug 'thinca/vim-qfreplace'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-scripts/ditaa'
Plug 'vim-scripts/DrawIt'
Plug 'vim-scripts/gtags.vim'
Plug 'vim-scripts/ifdef-highlighting'
Plug 'vim-scripts/TagHighlight'
Plug 'sheerun/vim-polyglot'
Plug 'wtsnjp/vim-expl3'
Plug 'luochen1990/rainbow'
Plug 'easymotion/vim-easymotion'
Plug 'SkyLeach/pudb.vim'
Plug 'majutsushi/tagbar'
Plug 'voldikss/vim-floaterm'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'junegunn/goyo.vim'
Plug 'terryma/vim-expand-region'


call plug#end()

" ddc {{{
call ddc#custom#patch_global('sources', ['vim-lsp', 'around', 'dictionary', 'deoppet'])

call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank']},
      \ 'vim-lsp': {
      \   'mark': 'LSP',
      \   'forceCompletionPattern': '\.\w*|:\w*|->\w*'},
      \ 'deoppet': {'dup': v:true, 'mark': 'SNIP'},
      \ 'around': {'mark': '📋'},
      \ 'dictionary': {'mark': '🔤'},
      \ })

call ddc#custom#patch_global('sourceParams', {
      \ 'dictionary': {
      \   'dictPaths': ['/usr/share/dict/words'],
      \   'smartCase': v:true},
      \ })

call ddc#enable()
call ddc_nvim_lsp_doc#enable()
" }}}


" deoppet {{{
call deoppet#initialize()
call deoppet#custom#option('snippets',
    \ map(globpath(&runtimepath, '*snippets', 1, 1),
    \     { _, val -> { 'path': val } }))

imap <C-k> <Plug>(deoppet_expand)
imap <expr><Tab>  deoppet#expandable() ?
      \ "\<Plug>(deoppet_expand)" : "\<Tab>"
imap <C-f>  <Plug>(deoppet_jump_forward)
imap <C-b>  <Plug>(deoppet_jump_backward)
xmap <C-l>  <Plug>(deoppet_select_text)
xmap <C-x>  <Plug>(deoppet_cut_text)

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif
" }}}


" quickrun {{{
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

nnoremap <silent> <leader>r :QuickRun<CR>


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
let $FZF_DEFAULT_COMMAND = 'rg --hidden --files -g ""'
let $FZF_DEFAULT_OPTS='--layout=reverse  --margin=1,1'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6, 'border': 'sharp' } }

nnoremap <silent><C-u><C-b> :Buffers<CR>
nnoremap <silent><C-u><C-c> :History:<CR>
nnoremap <silent><C-u><C-g> :Rg<CR>
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

" nerdcommenter
let NERDSpaceDelims = 1

" rooter {{{
let g:rooter_manual_only = 1
let g:rooter_patterns = ['.latexmkrc','GTAGS','tags','cscope.out','.git/']
let g:rooter_cd_cmd = "lcd"
let g:rooter_resolve_links = 1
let g:rooter_change_directory_for_non_project_files = 'current'
" }}}

" vim-choosewin
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" lightline {{{
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'modified' ]],
    \   'right': [ [ 'lineinfo', 'percent'], [ 'fileencoding', 'fileformat', 'filetype' ] ]
    \ },
    \ 'tab_component_function': {
    \   'tabnum': 'LightlineWebDevIcons',
    \ },
    \ 'component': {
    \   'readonly': '%{&filetype=="help"?"":&readonly?"\ue0a2":""}',
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
    \   'fugitive': '%{exists("*fugitive#head")&& strlen(fugitive#head())?"\ue0a0".fugitive#head():""}',
    \ },
    \ 'component_visible_condition': {
    \   'readonly': '(&filetype!="help"&& &readonly)',
    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
    \   'fugitive': '(exists("*fugitive#head") && strlen(fugitive#head()))'
    \ },
    \ 'component_function': {
    \   'filetype': 'DevIconFiletype',
    \   'fileformat': 'DevIconFileformat'
    \ },
    \ 'separator': { 'left': "\ue0b0" },
    \ 'subseparator': { 'left': "\ue0b1" }
    \ }
    " \ 'separator': { 'left': "󾂰" },
    " \ 'subseparator': { 'left': "󾂱" }
function! LightlineWebDevIcons(n)
  let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction

function! DevIconFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! DevIconFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
  endfunction
" }}}

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

" vimtex
" let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
            \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'

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
let g:gitgutter_sign_added = " "
let g:gitgutter_sign_modified = "🔨"
let g:gitgutter_sign_removed = " "
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

" vimtable
nnoremap <leader>ta :TableModeToggle<CR>

" julia
let g:default_julia_version = '1.6'

" vim-lsp {{{
let g:lsp_preview_float = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_virtual_text_enabled = 0

" icon
let g:lsp_diagnostics_signs_error = {'text': "\uf05e"}
let g:lsp_diagnostics_signs_warning = {'text': "\uf071"}
let g:lsp_diagnostics_signs_information = {'text': "\uf7fc"}
let g:lsp_diagnostics_signs_hint = {'text': "\uf848"}

" folding
set foldmethod=expr
      \ foldexpr=lsp#ui#vim#folding#foldexpr()
      \ foldtext=lsp#ui#vim#folding#foldtext()

let g:lsp_settings_filetype_typescript = 'typescript-language-server'
let g:lsp_settings_filetype_javascript = 'typescript-language-server'
let g:lsp_settings_filetype_vue = 'vls'
let g:lsp_settings_filetype_html = 'html-languageserver'
let g:lsp_settings_filetype_yaml = 'yaml-language-server'
let g:lsp_settings_filetype_dockerfile = 'dockerfile-language-server-nodejs'
let g:lsp_settings_filetype_xml = 'lemminx'
let g:lsp_settings_filetype_python = 'pylsp-all'


nnoremap <silent><leader>ld :LspDefinition<CR>
nnoremap <silent><leader>lf :LspDocumentFormat<CR>
nnoremap <silent><leader>lh :LspHover<CR>
nnoremap <silent><leader>lr :LspReferences<CR>

highlight link LspErrorText DiffDelete
" }}}

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
            \ 'selected_icon': ' ',
            \ })

call defx#custom#option('_', {
            \ 'columns': 'indent:git:space:mark:space:icons:space:filename:type:size:time',
            \ })

nnoremap <silent><C-u><C-f> :Defx -floating-preview -vertical-preview<CR>
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
                \ defx#do_action('preview')
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


" csv
let g:csv_no_conceal = 1

" rainbow
let g:rainbow_active = 1

" terminal
autocmd TermOpen * setlocal nonu

" pudb
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


" floaterm
highlight FloatermBorder cterm=none ctermfg=235 ctermbg=237
let g:floaterm_width=0.8
let g:floaterm_height=0.6
let g:floaterm_title=""
" let g:floaterm_borderchars=['─', '│', '─', '│', '┌', '┐', '┘', '└']

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

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


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
" set ambiwidth=double
set synmaxcol=320
set cursorcolumn
set ttyfast
set lazyredraw
" set mouse=a
" }}}


syntax on
colorscheme Atelier_SavannaDark

filetype plugin on

set termguicolors
" vim:set foldmethod=marker:
