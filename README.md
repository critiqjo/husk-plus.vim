# husk-plus.vim

Mappings that boost vim command line mode with (basic) undo support.

### Installation

* [vim-plug](https://github.com/junegunn/vim-plug)<br/>
`Plug 'critiqjo/husk-plus.vim'`

* [Vundle](https://github.com/gmarik/Vundle.vim)<br/>
`Plugin 'critiqjo/husk-plus.vim'`

*Note*: In order to enable alt mappings (`M-f`, `M-b` etc) Mac OS users using
Terminal.app may need to go to Preferences > Profiles > Keyboard and tick
"Use Option as Meta key".

### Mappings

All mappings work **only** in Vim command line mode. Below, "undoable" marks
those commands whose state before execution is pushed to the undo stack.

| Mapping                           | Description                | Default binding      | Undoable |
|-----------------------------------|----------------------------|----------------------|----------|
| `<Plug>(husk)cursor-home`         | wraps `<Home>`             | `<C-a>`              | no       |
| `<Plug>(husk)cursor-end`          | wraps `<End>`              | `<C-e>`              | no       |
| `<Plug>(husk)cursor-left`         | move cursor left           | `<M-h>`              | no       |
| `<Plug>(husk)cursor-right`        | move cursor right          | `<M-l>`              | no       |
| `<Plug>(husk)cursor-w-std`        | cursor w-jump              | `<M-w>`              | no       |
| `<Plug>(husk)cursor-b-std`        | cursor b-jump              | `<M-b>`              | no       |
| `<Plug>(husk)cursor-e-std`        | cursor e-jump              | `<M-e>`              | no       |
| `<Plug>(husk)cursor-ge-std`       | cursor ge-jump             | none                 | no       |
| `<Plug>(husk)cursor-w-alt`        | cursor W-jump              | `<M-W>`              | no       |
| `<Plug>(husk)cursor-b-alt`        | cursor B-jump              | `<M-B>`              | no       |
| `<Plug>(husk)cursor-e-alt`        | cursor E-jump              | `<M-E>`              | no       |
| `<Plug>(husk)history-prefix-up`   | wraps `<Up>`               | `<M-k>`              | yes      |
| `<Plug>(husk)history-prefix-down` | wraps `<Down>`             | `<M-j>`              | yes      |
| `<Plug>(husk)history-up`          | wraps `<Space><BS><C-p>`   | none                 | yes      |
| `<Plug>(husk)history-down`        | wraps `<Space><BS><C-n>`   | none                 | yes      |
| `<Plug>(husk)kill-line-forw`      | clear line after cursor    | `<C-k>`\*            | yes      |
| `<Plug>(husk)kill-line-backw`     | clear line backwards       | `<C-u>`              | yes      |
| `<Plug>(husk)kill-word-forw-std`  | delete "word" after cursor | `<M-d>`              | yes      |
| `<Plug>(husk)kill-word-backw-std` | delete "word" backwards    | `<C-w>`              | yes      |
| `<Plug>(husk)kill-word-forw-alt`  | delete "WORD" after cursor | `<C-f><M-d>`\**      | yes      |
| `<Plug>(husk)kill-word-backw-alt` | delete "WORD" backwards    | `<C-f><C-w>`\**      | yes      |
| `<Plug>(husk)kill-char-forw`      | wraps `<Del>`              | `<M-x>`              | no       |
| `<Plug>(husk)kill-char-backw`     | wraps `<BS>`               | none                 | no       |
| `<Plug>(husk)undo`                | pops the undo stack        | `<C-_>`<sup>\#</sup> | no       |
| `<Plug>(husk)leader`              | by itself, a `<NOP>`       | `<C-f>`\*            | NA       |

\* `<C-f><C-k>`\** is mapped to the default `<C-k>` behaviour, and if default
husk-leader mapping is not overridden, `<C-f><C-f>` gets mapped to the default
`<C-f>` behaviour.

\** `<C-f>` is due to the `<Plug>(husk)leader` mapping.

<sup>\#</sup> `<C-/>` and `<C-_>` seems identical to vim
(see [this SO answer](http://stackoverflow.com/a/9051932/2849934)).

### Configuration

| Global variable                   | Default | Description                         |
|-----------------------------------|---------|-------------------------------------|
| `g:husk#disable_default_leader`   | `0`     | Skip mapping husk leader to `<C-f>` |
| `g:husk#disable_default_bindings` | `0`     | Skip all default mappings           |
| `g:husk#undo_stack_capacity`      | `64`    | Undo stack max capacity             |
| `g:husk#undo_stack_cut_by`        | `16`    | When undo stack exceeds its capacity, the oldest `cut_by` number of items is popped off |

### Todo

* Support for (emacs-like) redos

### About

`husk-plus.vim` was inspired by [`vim-husk`](https://github.com/vim-utils/vim-husk) plugin.

Differences from `vim-husk`:

- support for undoing
- prefers "meta + [wWbBeE]" for word jumps
- removed [vim-rsi](https://github.com/tpope/vim-rsi) mappings and behaviour

### Licence

[MIT](LICENSE.md)
