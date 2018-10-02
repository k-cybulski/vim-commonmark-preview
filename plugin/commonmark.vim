if exists('g:loaded_Commonmark')
    finish
endif
let g:loaded_Commonmark = 1

let g:CommonmarkPreview = 0
fun CommonmarkTogglePreview()
    if g:CommonmarkPreview == 0
        let g:CommonmarkPreview = 1
    else
        let g:CommonmarkPreview = 0
    endif
endfun

fun CommonmarkPreview()
    if g:CommonmarkPreview == 1
        silent execute "!cmark " . bufname("%") . " > " . "." . bufname("%") . ".tmp.html"
        let l:CurrentEditorWindow=substitute(system("xdotool getactivewindow | xargs"), '\n\+$', '', '')
        silent !ps cax | grep surf
        if v:shell_error != 0
            silent execute "!(surf ." . bufname("%") . ".tmp.html > /dev/null 2>/dev/null && rm ." . bufname("%") . ".tmp.html) & "
        else
            silent execute "!xdotool click --window $(xdotool search --name \"." . bufname("%") . ".tmp.html\") 1"
            silent execute "!xdotool key --window $(xdotool search --name \"." . bufname("%") . ".tmp.html\") Ctrl+r"
            silent execute "!xdotool click --window " . l:CurrentEditorWindow . " 1"
        endif
        silent :redraw!
    endif
endfun


:autocmd BufWritePost *.md call CommonmarkPreview()
nmap <silent> <leader>md :call CommonmarkTogglePreview() <CR> :call CommonmarkPreview()<CR>
