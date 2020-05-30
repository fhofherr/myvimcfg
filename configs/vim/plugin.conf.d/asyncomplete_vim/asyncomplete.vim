if !dotfiles#plugin#selected('asyncomplete.vim') || exists('g:did_cfg_asyncomplete')
    finish
endif
let g:did_cfg_asyncomplete = 1

let g:asyncomplete_popup_delay = 15

" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ asyncomplete#force_refresh()

function! s:check_back_space() abort "{{{
    let l:col = col('.') - 1
    return !l:col || getline('.')[l:col - 1]  =~ '\s'
endfunction"}}}
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Trigger manual completion using c-space
imap <c-space> <Plug>(asyncomplete_force_refresh)

function s:configure_asyncomplete()
    if dotfiles#plugin#selected('ale')
        call asyncomplete#register_source(asyncomplete#sources#ale#get_source_options({
                    \ 'name': 'ale',
                    \ 'whitelist': ['*'],
                    \ }))
    endif

    if dotfiles#plugin#selected('asyncomplete-buffer.vim')
        call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
                    \ 'name': 'buffer',
                    \ 'whitelist': ['*'],
                    \ 'completor': function('asyncomplete#sources#buffer#completor'),
                    \ }))
    endif

    if dotfiles#plugin#selected('asyncomplete-file.vim')
        call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
                    \ 'name': 'file',
                    \ 'whitelist': ['*'],
                    \ 'completor': function('asyncomplete#sources#file#completor')
                    \ }))
    endif

    if dotfiles#plugin#selected('asyncomplete-necovim.vim')
        call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
                    \ 'name': 'necovim',
                    \ 'whitelist': ['vim'],
                    \ 'completor': function('asyncomplete#sources#necovim#completor'),
                    \ }))
    endif

    if dotfiles#plugin#selected('asyncomplete-omni.vim')
        call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
                    \ 'name': 'omni',
                    \ 'whitelist': ['*'],
                    \ 'blacklist': ['c', 'cpp', 'go', 'html'],
                    \ 'completor': function('asyncomplete#sources#omni#completor')
                    \  }))
    endif

    if dotfiles#plugin#selected('asyncomplete-tags.vim')
        call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
                    \ 'name': 'tags',
                    \ 'whitelist': ['c'],
                    \ 'completor': function('asyncomplete#sources#tags#completor'),
                    \ }))
    endif

    if dotfiles#plugin#selected('asyncomplete-ultisnips.vim')
        call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
                    \ 'name': 'ultisnips',
                    \ 'whitelist': ['*'],
                    \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
                    \ }))
    endif
endfunction

augroup dotfiles_asyncomplete
    autocmd!

    " Auto-close preview window after completion
    autocmd CompleteDone * if pumvisible() == 0 | pclose | endif

    autocmd User asyncomplete_setup call <SID>configure_asyncomplete()
augroup END