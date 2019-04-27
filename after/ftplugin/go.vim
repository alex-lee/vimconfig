setlocal balloonexpr=GOVIMBalloonExpr()
setlocal omnifunc=GOVIMComplete

nnoremap <buffer> <silent> <Leader>d :GOVIMGoToDef<CR>
nnoremap <buffer> <silent> <Leader>D :GOVIMGoToPrevDef<CR>
nnoremap <buffer> <Leader>i : <C-u>echo GOVIMHover()<CR>
