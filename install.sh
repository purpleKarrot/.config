#!/bin/sh

for file in config profile xprofile
do
  rm -rf ~/.$file
  ln -s ~/Projects/dotfiles/$file ~/.$file
done

mkdir -p \
  ~/.cache/mail/gmail \
  ~/.cache/mail/mailbox \
  ~/.cache/mpd/playlists \
  ~/.local/share/newsbeuter

sudo pacman -S --needed --noconfirm \
  base-devel \
  abduco \
  ccache \
  cgdb \
  clang \
  cmake \
  diff-so-fancy \
  dvtm \
  fd \
  feh \
  fish \
  go \
  hub \
  i3blocks \
  i3lock \
  i3-wm \
  imagemagick \
  isync \
  jq \
  kakoune \
  khal \
  khard \
  meson \
  mpd \
  ncdu \
  neomutt \
  newsboat \
  ninja \
  noto-fonts \
  noto-fonts-emoji \
  openssh \
  pass \
  ripgrep \
  rmlint \
  rofi \
  termite \
  tig \
  tree \
  ttf-font-awesome \
  vdirsyncer \
  xclip \
  xdg-user-dirs \
  zathura-pdf-mupdf

go get \
  github.com/nsf/gocode \
  github.com/zmb3/gogetdoc \
  golang.org/x/tools/cmd/goimports

yay -S \
  kak-lsp-git \
  pandoc-bin \
  pandoc-citeproc-bin \
  pandoc-crossref-bin \
  ttf-fantasque-sans-mono
