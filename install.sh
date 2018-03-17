#!/usr/bin/env sh

dotfiles="$HOME/.dotfiles"

# to error out
warn() {
  echo "$1" >&2
}

die() {
  warn "$1"
  exit 1
}

lnif() {
  if [ ! -e $2 ] ; then
    ln -s $1 $2
  fi
}

echo "Installing/Updating dotfiles...\n"

if [ ! -e $dotfiles/.git ]; then
  echo "Cloning dotfiles\n"
  git clone https://github.com/duyhenryer/dotfiles.git $dotfiles
else
  echo "Updating dotfiles...\n"
  cd $dotfiles && git pull
fi

echo "Installing software....\n"
echo ""
sudo pacman -S chromium firefox flashplayer  


echo "Setting up ...\n"
echo " "
lnif $dotfiles/bash_profile $HOME/.bash_profile
lnif $dotfiles/bashrc $HOME/.bashrc
lnif $dotfiles/Xresources.d $HOME/.Xresources.d
lnif $dotfiles/gitconfig $HOME/.gitconfig
lnif $dotfiles/gitignore $HOME/.gitignore
lnif $dotfiles/xinitrc $HOME/.xinitrc
lnif $dotfiles/Xresources $HOME/.Xresources
lnif $dotfiles/zshrc $HOME/.zshrc
lnif $dotfiles/tmux.conf $HOME/.tmux.conf
lnif $dotfiles/aliases $HOME/.aliases
lnif $dotfiles/st $HOME./st
lnif $dotfiles/font $HOME/.font

# vim
echo "Setting up vim...\n"
lnif $dotfiles/vimrc $HOME/.vimrc
lnif $dotfiles/vim $HOME/.vim

# Install homebrew
which brew > /dev/null
if [ "$?" -ne 0 ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
