#!/bin/sh

for file in config profile xprofile
do
  rm -rf ~/.$file
  ln -s ~/Projects/dotfiles/$file ~/.$file
done

sudo pacman -S --needed --noconfirm \
  base-devel \
  abduco \
  ccache \
  cgdb \
  clang \
  cmake \
  diff-so-fancy \
  dvtm \
  feh \
  fish \
  hub \
  i3blocks \
  i3lock \
  i3-wm \
  imagemagick \
  jq \
  kakoune \
  khal \
  ncdu \
  neomutt \
  newsboat \
  ninja \
  noto-fonts \
  openssh \
  otf-font-awesome \
  rmlint \
  rofi \
  termite \
  tig \
  tree \
  ttf-font-awesome \
  vdirsyncer \
  xclip \
  zathura-pdf-mupdf
