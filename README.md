# rc

This repo has just a vim config right now, but the goal is to centralize most
of my config files here.

## vim

A small yet efficient vimrc.

Features:

 - autochdir to automatically cd to the file currently being edited,
 - ^A/^X work on letters,
 - highlighting of characters over 79 (can be toggled with ^H),
 - bash-like completion in commands,
 - smart folding on space,
 - gw to toggle wrapping,
 - ^J/^K to move lines around (I didn't use them to scroll in normal mode),
 - a pretty statusbar inspired by https://github.com/Lokaltog/vim-powerline,
 - automatic return to last edit position when you open a file,

And:

 - Portability on older versions,
 - Does not require plugins nor add any.

The only third party plugin mentioned is
https://github.com/Lokaltog/vim-easymotion that avoids counting stuff or
spamming keys when moving around (it looks and works like the f in vimperator).
It works perfectly well without it anyway.


