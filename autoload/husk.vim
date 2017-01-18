function! s:match_right(pat)
  let line = getcmdline()
  let pos = getcmdpos()
  let next = match(line, a:pat, pos - 1, 1) + 1
  if next == pos
    let next = match(line, a:pat, pos - 1, 2) + 1
  endif
  return next
endfun

function! s:match_left(pat)
  let line = getcmdline()
  let pos = getcmdpos()
  let i = 1
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
  return getcmdpos()<2 ? "\<C-e>\<C-u>" : "\<C-\>egetcmdline()[0:getcmdpos()-2]\<CR>"
endfun

function! husk#stack_push(item)
  if !exists('s:undo_stack')
    let s:undo_stack = []
  endif
  let cap = get(g:, 'husk#undo_stack_capacity', 64)
  let cut = get(g:, 'husk#undo_stack_cut_by', 16)
  if len(s:undo_stack) >= cap
    let cut = cut<2 ? 0 : cut-1
    unlet s:undo_stack[0:cut]
  endif
  call add(s:undo_stack, a:item)
endfun

function! husk#stack_pop()
  if !exists('s:undo_stack') || empty(s:undo_stack)
    return getcmdline()
  endif
  let item = s:undo_stack[-1]
  unlet s:undo_stack[-1]
  call setcmdpos(item['pos'])
  return item['txt']
endfun

function! husk#undo()
  return "\<C-\>ehusk#stack_pop()\<CR>"
endfun

function! husk#exe(expr)
  call husk#stack_push({'txt': getcmdline(), 'pos': getcmdpos()})
  exe 'return ' . a:expr
endfun
