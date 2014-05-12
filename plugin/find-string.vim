" File:         find-string.vim
" Author:       David Mohundro <david@mohundro.com>
" URL:          http://mohundro.com
"
" This script is just a provider for the PowerShell find-string
" script, that is itself an homage to Ack. In fact,
" this script is based *heavily* on the ack.vim script from
" http://github.com/mileszs/ack.vim/. So, thanks to all of the
" aforementioned projects.

if !exists("g:findstring_apply_qmappings")
  let g:findstring_apply_qmappings = !exists("g:findstring_qhandler")
endif

if !exists("g:findstring_qhandler")
  let g:findstring_qhandler="botright copen"
endif

if !exists("g:findstring_lhandler")
  let g:findstring_lhandler="botright lopen"
endif

function! s:FindString(cmd, args)
  redraw
  echo "Searching ..."

  " If no pattern is provided, search for the word under the cursor
  if empty(a:args)
    let l:grepargs = expand("<cword>")
  else
    let l:grepargs = a:args . join(a:000, ' ')
  end

  let findstringprg="ps-find-string"
  let findstringformat="%f:%l:%m"

  let grepprg_bak=&grepprg
  let grepformat_bak=&grepformat
  try
    let &grepprg=findstringprg
    let &grepformat=findstringformat
    silent execute a:cmd . " " . escape(l:grepargs, '|')
  finally
    let &grepprg=grepprg_bak
    let &grepformat=grepformat_bak
  endtry

  if a:cmd =~# '^l'
    exe g:findstring_lhandler
    let l:apply_mappings = g:findstring_apply_lmappings
  else
    exe g:findstring_qhandler
    let l:apply_mappings = g:findstring_apply_qmappings
  endif

  if l:apply_mappings
    exec "nnoremap <silent> <buffer> q :ccl<CR>"
    exec "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
    exec "nnoremap <silent> <buffer> T <C-W><CR><C-W>TgT<C-W><C-W>"
    exec "nnoremap <silent> <buffer> o <CR>"
    exec "nnoremap <silent> <buffer> go <CR><C-W><C-W>"
    exec "nnoremap <silent> <buffer> h <C-W><CR><C-W>K"
    exec "nnoremap <silent> <buffer> H <C-W><CR><C-W>K<C-W>b"
    exec "nnoremap <silent> <buffer> v <C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t"
    exec "nnoremap <silent> <buffer> gv <C-W><CR><C-W>H<C-W>b<C-W>J"
  endif

  redraw!
endfunction

command! -bang -nargs=* -complete=file FindString call s:FindString('grep<bang>',<q-args>)
