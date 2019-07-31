" ---------------------------------------------------------------------------
"
" vim-go
"
" ---------------------------------------------------------------------------
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

" We use ALE for linting. Therefore we disable all linters for vim-go.
let g:go_metalinter_autosave = 0

" We use ALE for fixing, too. Therefore we disable formatting on save.
" Nevertheless we configure to program to format above, should we want
" to format manually using :GoFmt.
let g:go_fmt_autosave = 0
