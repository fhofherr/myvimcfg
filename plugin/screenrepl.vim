if exists("loaded_screenrepl")
    finish
endif
let loaded_screenrepl = 1

python import screenrepl.vimfuncs as vf

function! Connect_to_Screen()
    python vf.connect_to_screen()
endfunction

function! Start_REPL()
    python vf.start_repl()
endfunction

function! Send_to_Screen() range
    python vf.send_to_screen()
endfunction

" Define commands that can be used with this plugin
command ScConnect call Connect_to_Screen() 
command ScStarREPL call Start_REPL()
command -range ScSend :<line1>,<line2>call Send_to_Screen()

vmap <C-c><C-c> :call Send_to_Screen()<CR>