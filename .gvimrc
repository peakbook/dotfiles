let s:is_win = has('win32') || has('win64')
let s:is_unix = has('unix')


if s:is_win
	"set guifont=MS_Gothic:h10:cSHIFTJIS
	set guifont=Migu_1M:h11:cSHIFTJIS
	let g:errormarker_erroricon = expand('~/.vim/signs/err.bmp')
	let g:errormarker_warningicon = expand('~/.vim/signs/warn.bmp')
elseif s:is_unix
    set guifont=Ricty\ 12
endif

colorscheme gentooish

" augroup hack234
" 	autocmd!
" 	autocmd FocusGained * set transparency=240
" 	autocmd FocusLost * set transparency=200
" augroup END

set showtabline=2
set guioptions-=T " remove toolbar
set guioptions-=m " remove menu bar

highlight Pmenu guibg=DarkMagenta guifg=darkgray

"" window position
let g:save_window_file = expand('~/.vimwinpos')
augroup SaveWindow
    autocmd!
    autocmd VimLeavePre * call s:save_window()
    function! s:save_window()
        let options = [
                    \ 'set columns=' . &columns,
                    \ 'set lines=' . &lines,
                    \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
                    \ ]
        call writefile(options, g:save_window_file)
    endfunction
augroup END

if filereadable(g:save_window_file)
    execute 'source' g:save_window_file
endif
