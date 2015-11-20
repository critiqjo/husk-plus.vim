" ============================================================================
" File: husk.vim
" Authors: Bruno Sutic, John C F
" WebPage: https://github.com/critiqjo/husk-plus.vim
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
  cnoremap <Plug>(husk)cursor-home <Home>
  cnoremap <Plug>(husk)cursor-end <End>
  cnoremap <Plug>(husk)cursor-left <Left>
  cnoremap <Plug>(husk)cursor-right <Right>
  cnoremap <expr> <Plug>(husk)cursor-w-std husk#abstract_w("\<Right>")
  cnoremap <expr> <Plug>(husk)cursor-b-std husk#abstract_b("\<Left>")
  cnoremap <expr> <Plug>(husk)cursor-e-std husk#abstract_e("\<Right>")
  cnoremap <expr> <Plug>(husk)cursor-ge-std husk#abstract_ge("\<Left>")
  cnoremap <expr> <Plug>(husk)cursor-w-alt husk#abstract_w_alt("\<Right>")
  cnoremap <expr> <Plug>(husk)cursor-b-alt husk#abstract_b_alt("\<Left>")
  cnoremap <expr> <Plug>(husk)cursor-e-alt "\<S-Right>"

  cnoremap <expr> <Plug>(husk)history-prefix-up husk#exe('"\<Up>"')
  cnoremap <expr> <Plug>(husk)history-prefix-down husk#exe('"\<Down>"')
  cnoremap <expr> <Plug>(husk)history-up husk#exe('wildmenumode() ? " \<BS>\<C-p>" : "\<C-p>"')
  cnoremap <expr> <Plug>(husk)history-down husk#exe('wildmenumode() ? " \<BS>\<C-n>" : "\<C-n>"')

  cnoremap <expr> <Plug>(husk)kill-line-forw husk#exe('husk#kill_line_forw()')
  cnoremap <expr> <Plug>(husk)kill-line-backw husk#exe('"\<C-u>"')
  cnoremap <expr> <Plug>(husk)kill-word-forw-std husk#exe('husk#abstract_w("\<Del>")')
  cnoremap <expr> <Plug>(husk)kill-word-backw-std husk#exe('husk#abstract_b("\<BS>")')
  cnoremap <expr> <Plug>(husk)kill-word-forw-alt husk#exe('husk#abstract_w_alt("\<Del>")')
  cnoremap <expr> <Plug>(husk)kill-word-backw-alt husk#exe('husk#abstract_b_alt("\<BS>")')
  cnoremap <expr> <Plug>(husk)kill-char-forw "\<Del>"
  cnoremap <expr> <Plug>(husk)kill-char-backw "\<BS>"
  cnoremap <expr> <Plug>(husk)undo husk#undo()

  cnoremap <Plug>(husk)leader <NOP>
  cnoremap <expr> <Plug>(husk)leader<Plug>(husk)undo husk#reverse_undo()
endfun

function! s:bindkeys()
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

  if !get(g:, 'husk#disable_default_leader', 0)
    cmap <C-f> <Plug>(husk)leader
    cnoremap <C-f><C-f> <C-f>
  endif
  cmap <C-_> <Plug>(husk)undo

  cmap <M-x> <Plug>(husk)kill-char-forw
  cmap <M-d> <Plug>(husk)kill-word-forw-std
  cmap <C-w> <Plug>(husk)kill-word-backw-std
  cmap <Plug>(husk)leader<M-d> <Plug>(husk)kill-word-forw-alt
  cmap <Plug>(husk)leader<C-w> <Plug>(husk)kill-word-backw-alt
  cmap <C-k> <Plug>(husk)kill-line-forw
  cnoremap <Plug>(husk)leader<C-k> <C-k>

  cmap <C-a> <Plug>(husk)cursor-home
  cmap <C-e> <Plug>(husk)cursor-end
  cmap <M-w> <Plug>(husk)cursor-w-std
  cmap <M-b> <Plug>(husk)cursor-b-std
  cmap <M-e> <Plug>(husk)cursor-e-std
  cmap <M-W> <Plug>(husk)cursor-w-alt
  cmap <M-B> <Plug>(husk)cursor-b-alt
  cmap <M-E> <Plug>(husk)cursor-e-alt
  cmap <M-h> <Plug>(husk)cursor-left
  cmap <M-l> <Plug>(husk)cursor-right
  cmap <M-j> <Plug>(husk)history-prefix-down
  cmap <M-k> <Plug>(husk)history-prefix-up
endfun

call <SID>enable_husk()
if !get(g:, 'husk#disable_default_bindings', 0)
  call <SID>bindkeys()
endif

let &cpo = s:save_cpo
unlet s:save_cpo
