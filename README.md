# husk-x.vim

Mappings that boost vim command line mode with (basic) undo support.

### Installation

* [vim-plug](https://github.com/junegunn/vim-plug)<br/>
`Plug 'critiqjo/husk-x.vim'`

* [Vundle](https://github.com/gmarik/Vundle.vim)<br/>
`Plugin 'critiqjo/husk-x.vim'`

*Note*: In order to enable alt mappings (`M-f`, `M-b` etc) Mac OS users using
Terminal.app may need to go to Preferences > Profiles > Keyboard and tick
"Use Option as Meta key".

### Mappings

All mappings work **only** in Vim command line mode. Below, "undoable" marks
those commands whose state before execution is pushed to the undo stack.

| Mapping              | Description                | Undoable |
|----------------------|----------------------------|----------|
| `<C-a>`              | wraps `<Home>`             | no       |
| `<C-e>`              | wraps `<End>`              | no       |
| `<M-h>`              | move cursor left           | no       |
| `<M-l>`              | move cursor right          | no       |
| `<M-w>`              | cursor w-jump              | no       |
| `<M-b>`              | cursor b-jump              | no       |
| `<M-e>`              | cursor e-jump              | no       |
| `<M-W>`              | cursor W-jump              | no       |
| `<M-B>`              | cursor B-jump              | no       |
| `<M-E>`              | cursor E-jump              | no       |
| `<M-k>`              | wraps `<Up>`               | yes      |
| `<M-j>`              | wraps `<Down>`             | yes      |
| `<C-k>`\*            | clear line after cursor    | yes      |
| `<C-u>`              | clear line backwards       | yes      |
| `<M-d>`              | delete "word" after cursor | yes      |
| `<C-w>`              | delete "word" backwards    | yes      |
| `<M-x>`              | wraps `<Del>`              | no       |
| `<C-_>`<sup>\#</sup> | pops the undo stack        | no       |

\* For the default `<C-k>` behavior, open command-line window using `<C-f>`.

<sup>\#</sup> `<C-/>` and `<C-_>` seems identical to vim
(see [this SO answer](http://stackoverflow.com/a/9051932/2849934)).

### Configuration

| Global variable                   | Default | Description                         |
|-----------------------------------|---------|-------------------------------------|
| `g:husk#undo_stack_capacity`      | `64`    | Undo stack max capacity             |
| `g:husk#undo_stack_cut_by`        | `16`    | When undo stack exceeds its capacity, the oldest `cut_by` number of items is popped off |

### Non-goals

* Redos

### About

`husk-x.vim` was inspired by [`vim-husk`](https://github.com/vim-utils/vim-husk) plugin.

Differences from `vim-husk`:

- support for undoing
- prefers "meta + [wWbBeE]" for word jumps
- removed [vim-rsi](https://github.com/tpope/vim-rsi) mappings and behaviour

### Licence

[MIT](LICENSE.md)
