function! s:match_right(pat)
  let line = getcmdline()
  let pos = getcmdpos()
  return match(line, a:pat, pos, 1) + 1
endfun

function! s:match_left(pat)
  let line = getcmdline()
  let pos = getcmdpos()
  let i = 0
  let next = 1
  let nextnext = 1
  while nextnext < pos
    let next = nextnext
    let nextnext = match(line, a:pat, 0, i) + 1
    let i += 1
  endwhile
  return next
endfun

function! husk#abstract_w(command)
  let pos = getcmdpos()
  let next = s:match_right('\s\zs\S\|\<\w\|$')
  return repeat(a:command, next - pos)
endfun

function! husk#abstract_b(command)
  let pos = getcmdpos()
  let next = s:match_left('\s\zs\S\|\<\w\|^\|$')
  return repeat(a:command, pos - next)
endfun

function! husk#abstract_e(command)
  let pos = getcmdpos()
  let next = s:match_right('\S\zs\s\|\w\zs\>\|$')
  return repeat(a:command, next - pos)
endfun

function! husk#abstract_ge(command)
  let pos = getcmdpos()
  let next = s:match_left('\S\zs\s\|\w\zs\>\|^\|$')
  return repeat(a:command, pos - next)
endfun

function! husk#abstract_w_alt(command)
  let pos = getcmdpos()
  let next = s:match_right('\s\zs\S\|$')
  return repeat(a:command, next - pos)
endfun

function! husk#abstract_b_alt(command)
  let pos = getcmdpos()
  let next = s:match_left('\s\zs\S\|^\|$')
  return repeat(a:command, pos - next)
endfun

function! husk#kill_line_forw()
  return getcmdpos()<2 ? "<C-e><C-u>" : "<C-\>egetcmdline()[0:getcmdpos()-2]<CR>"
endfun
