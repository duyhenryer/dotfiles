# ![icon](WallPaper/icon.svg) dotfiles


[![Build Status](https://travis-ci.org/duyhenryer/dotfiles.svg)](https://travis-ci.org/duyhenryer/dotfiles)
 
Arch Linux private dotfiles, for backup purpose

## Config thinkfan for Lennovo Thinkpab T430

Thinkfan of Lenovo Thinkpab T430 : `thinkfan.conf`

## Somthing news

Change something like `zsh`, `tmux`, `vim`, `rofi` ... . Merge into the easy-to-install and uninstall folder if you don't like it.

## How to setup.
I follow a very modular approach. If you don't want something you can just remove it's folder. Imagine you don't want Neovim. You can just delete nvim folder. It's that simple.

Start by cloning my dotfiles into `~/.dotfiles`. You should do the same with my spells repository. Some scripts needed are there.

```
git clone https://github.com/duyhenryer/dotfiles ~/.dotfiles

```

Depending on your Linux distribution you should change the distro.sh accordingly.
```
cd ~/.dotfiles
make install
```

## How to Uninstall
```
cd ~/.dotfiles
make uninstall
```
### Other dotfiles
- [i3wm-config](https://github.com/duyhenryer/i3wm-config)

#### Misc
Contact me: [Telegram](https://t.me/duyhenryer)
