" File:         find-string.vim
" Author:       David Mohundro <david@mohundro.com>
" URL:          http://mohundro.com
"
" This script is just a provider for the PowerShell find-string
" script, that is itself an homage to Ack. In fact,
" this script is based *heavily* on the ack.vim script from
" http://github.com/mileszs/ack.vim/. So, thanks to all of the
" aforementioned projects.

function! s:FindString(cmd, args)
  redraw
  echo "Searching ..."

  let findstringprg="ps-find-string"
  let findstringformat="%f:%l:%m"

  let grepprg_bak=&grepprg
  let grepformat_bak=&grepformat
  try
    let &grepprg=findstringprg
    let &grepformat=findstringformat
    silent execute a:cmd . " " . a:args
  finally
    let &grepprg=grepprg_bak
    let &grepformat=grepformat_bak
  endtry

  if a:cmd =~# '^l'
    botright lopen
  else
    botright copen
  endif
  redraw!
endfunction

command! -bang -nargs=* -complete=file FindString call s:FindString('grep<bang>',<q-args>)
