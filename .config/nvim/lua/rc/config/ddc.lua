vim.cmd([[
call ddc#custom#patch_global('sources', [
      \ 'skkeleton',
      \ 'vim-lsp',
      \ 'around',
      \ 'dictionary',
      \ 'deoppet'])

call ddc#custom#patch_global('sourceOptions', {
      \ '_': { 
        \ 'matchers': ['matcher_head'],
        \ 'sorters': ['sorter_rank']
        \ },
        \ 'vim-lsp': {'mark': 'LSP', 'forceCompletionPattern': '\.\w*|:\w*|->\w*' },
        \ 'deoppet': {'dup': v:true, 'mark': 'SNP'},
        \ 'around': {'mark': '📋'},
        \ 'dictionary': {'mark': 'DIC'},
        \ 'skkeleton': {
          \ 'mark': 'SKK',
          \ 'matchers': ['skkeleton'],
          \ 'sorters': []}
          \ })

call ddc#custom#patch_global('sourceParams', {
      \ 'dictionary': {
        \ 'dictPaths': ['/usr/share/dict/words'],
        \ 'smartCase': v:true},
        \ })

" call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#enable()
]])
