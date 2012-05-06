let s:is_win = has('win32') || has('win64')
let s:is_unix = has('unix')


if s:is_win
	set guifont=MS_Gothic:h10:cSHIFTJIS
elseif s:is_unix
    set guifont=Ricty\ 12
endif


colorscheme desert

set showtabline=2

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
