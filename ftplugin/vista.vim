" Copyright (c) 2019 Liu-Cheng Xu
" MIT License
" vim: ts=2 sw=2 sts=2 et

" No usual did_ftplugin check here

setlocal
  \ nonumber
  \ norelativenumber
  \ nopaste
  \ nomodeline
  \ noswapfile
  \ nocursorline
  \ nocursorcolumn
  \ colorcolumn=
  \ nobuflisted
  \ buftype=nofile
  \ bufhidden=hide
  \ nomodifiable
  \ signcolumn=no
  \ textwidth=0
  \ nolist
  \ winfixwidth
  \ winfixheight
  \ nospell
  \ nofoldenable
  \ foldcolumn=0
  \ nowrap

setlocal foldmethod=expr
setlocal foldexpr=vista#fold#Expr()
setlocal foldtext=vista#fold#Text()

let &l:statusline = vista#statusline()

nnoremap <buffer> <silent> q    :close<CR>
nnoremap <buffer> <silent> <CR> :<c-u>call vista#cursor#FoldOrJump()<CR>
nnoremap <buffer> <silent> /    :<c-u>call vista#finder#fzf#Run()<CR>

if get(g:, 'vista_echo_cursor', 1)
  augroup VistaCursor
    autocmd!
    autocmd CursorMoved <buffer> call vista#cursor#ShowDetailWithDelay()
  augroup END
endif
