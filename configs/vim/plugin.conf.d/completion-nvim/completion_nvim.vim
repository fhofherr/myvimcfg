if !dotfiles#plugin#selected('completion-nvim') || !dotfiles#plugin#selected('nvim-lsp') || exists('g:did_cfg_completion_nvim')
    finish
endif
let g:did_cfg_completion_nvim = 1

let g:completion_auto_change_source = 0
let g:completion_timer_cycle = 100
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_matching_strategy_list = ['exact', 'fuzzy']

set completeopt=menuone,noinsert

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function s:attach()
    try
        lua require'completion'.on_attach()
    catch
        return
    endtry
endfunction

augroup dotfiles_completion_nvim
    autocmd!
    autocmd BufEnter,BufNewFile * call <SID>attach()
augroup END