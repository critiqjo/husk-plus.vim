" ============================================================================
" File: husk.vim
" Authors: Bruno Sutic, John C F
" WebPage: https://github.com/critiqjo/husk-x.vim
" ============================================================================

if exists('g:loaded_husk') && g:loaded_husk
  finish
endif
let g:loaded_husk = 1

let s:save_cpo = &cpo
set cpo&vim

set ttimeout
if &ttimeoutlen == -1
  set ttimeoutlen=50
endif

function! s:enable_husk()
  cnoremap <C-a> <Home>
  cnoremap <C-e> <End>
  cnoremap <M-h> <Left>
  cnoremap <M-l> <Right>
  cnoremap <expr> <M-w> husk#abstract_w("\<Right>")
  cnoremap <expr> <M-b> husk#abstract_b("\<Left>")
  cnoremap <expr> <M-e> husk#abstract_e("\<Right>")
  cnoremap <expr> <M-W> husk#abstract_w_alt("\<Right>")
  cnoremap <expr> <M-B> husk#abstract_b_alt("\<Left>")
  cnoremap <expr> <M-E> "\<S-Right>"

  cnoremap <expr> <M-k> husk#exe('"\<Up>"')
  cnoremap <expr> <M-j> husk#exe('"\<Down>"')

  cnoremap <expr> <C-k> husk#exe('husk#kill_line_forw()')
  cnoremap <expr> <C-u> husk#exe('"\<C-u>"')
  cnoremap <expr> <M-d> husk#exe('husk#abstract_w("\<Del>")')
  cnoremap <expr> <C-w> husk#exe('husk#abstract_b("\<BS>")')
  cnoremap <expr> <M-x> "\<Del>"
  cnoremap <expr> <C-_> husk#undo()
endfun

if !has('gui_running') && !has('nvim')
  cmap <Esc>w <M-w>
  cmap <Esc>b <M-b>
  cmap <Esc>e <M-e>
  cmap <Esc>W <M-W>
  cmap <Esc>B <M-B>
  cmap <Esc>E <M-E>
  cmap <Esc>d <M-d>
  cmap <Esc>h <M-h>
  cmap <Esc>j <M-j>
  cmap <Esc>k <M-k>
  cmap <Esc>l <M-l>
  cmap <Esc>x <M-x>

  cnoremap <nowait> <expr> <Esc> stridx(&cpo, 'x') < 0 ? "\<C-c>" : "\<Esc>"
endif

call <SID>enable_husk()

let &cpo = s:save_cpo
unlet s:save_cpo
