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
        let l:cssStyle = "<style type=\"text/css\">body{margin:40px auto;max-width:640px;line-height:1.3;font-size:18px;color:\\#444;padding:0 10px}h1{line-height:1.4}</style>"
        let l:htmlFileName = "." . bufname("%") . ".tmp.html"
        silent execute "!echo \"" . l:cssStyle . "\" > " . l:htmlFileName
        silent execute "!cmark " . bufname("%") . " >> " . l:htmlFileName
        let l:CurrentEditorWindow=substitute(system("xdotool getactivewindow | xargs"), '\n\+$', '', '')
        silent !ps cax | grep surf
        if v:shell_error != 0
            silent execute "!(surf ." . bufname("%") . ".tmp.html > /dev/null 2>/dev/null && rm " . l:htmlFileName . ") & "
        else
            silent execute "!xdotool click --window $(xdotool search --name \"" . l:htmlFileName . "\") 1"
            silent execute "!xdotool key --window $(xdotool search --name \"" . l:htmlFileName . "\") Ctrl+r"
            silent execute "!xdotool click --window " . l:CurrentEditorWindow . " 1"
        endif
        silent :redraw!
    endif
endfun


:autocmd BufWritePost *.md call CommonmarkPreview()
nmap <silent> <leader>md :call CommonmarkTogglePreview() <CR> :call CommonmarkPreview()<CR>
