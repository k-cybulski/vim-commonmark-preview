# vim-commonmark-preview
This is a minimalistic plugin to compile and display
[CommonMark](https://github.com/commonmark/cmark) flavoured markdown live in a
[surf](https://surf.suckless.org/) window next to vim, vimtex style. 

## Disclaimer
It is _very_ minimalistic, by which I mean it has hardly any features and more
resembles a malformed shell script glued together in vimscript than an actual plugin.
Nonetheless, this is what works for me - I found other markdown plugins to miss my
use case or to depend on Chrome or other fancy software that I wouldn't want to run
next to vim. 

In fact, this is so rought that probably if you know anything about vimscript you
could improve it many times over. Speaking of which, pull requests are more than
welcome.

## Setup
This script requires these programs:
  - [cmark](https://github.com/commonmark/cmark) for Markdown compilation
  - [surf](https://surf.suckless.org/) for HTML rendering
  - [xdotool](https://github.com/jordansissel/xdotool) for interacting with `surf`,
    e.g. reloading the preview

On Arch simply:
```
sudo pacman -S cmark surf xdotool
```
and then install the plugin itself with your favourite vim plugin installer, e.g.
Vundle:
```
Plugin 'k-cybulski/vim-commonmark-preview' " Markdown preview
```

### Usage
To toggle the preview type `<leader>md`, which by default is `\md`

Now whenever you save your markdown file the `surf` window will refresh and you will
see the lovely results of your work.

## Contributions
Oh god please, if you know anything about vimscript send help. Pull requests more
than welcome.
