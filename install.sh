#!/bin/sh

for file in config profile xprofile
do
  rm -rf ~/.$file
  ln -s ~/Projects/dotfiles/$file ~/.$file
done

mkdir -p \
  ~/Desktop \
  ~/Documents \
  ~/Downloads \
  ~/Music \
  ~/Pictures \
  ~/Public \
  ~/Templates \
  ~/Videos \
  ~/.cache/mail/gmail \
  ~/.cache/mail/mailbox \
  ~/.cache/mpd/playlists \
  ~/.local/share/newsbeuter

sudo pacman -S --needed --noconfirm \
  base-devel \
  abduco \
  acpi \
  aria2 \
  ccache \
  cgdb \
  clang \
  cmake \
  colordiff \
  diff-so-fancy \
  dvtm \
  fd \
  feh \
  fish \
  fzf \
  go \
  hub \
  i3blocks \
  i3lock \
  i3-wm \
  imagemagick \
  imv \
  isync \
  jq \
  kak-lsp \
  kakoune \
  khal \
  khard \
  meson \
  mpd \
  mpv \
  ncdu \
  neomutt \
  newsboat \
  ninja \
  noto-fonts \
  noto-fonts-emoji \
  openssh \
  pass \
  pavucontrol \
  pulseaudio \
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
  xss-lock \
  youtube-dl \
  zathura-pdf-mupdf

. ~/.profile

go get -v \
  github.com/nsf/gocode \
  github.com/zmb3/gogetdoc \
  golang.org/x/tools/cmd/goimports

yay -S \
  ccls \
  pandoc-bin \
  pandoc-citeproc-bin \
  pandoc-crossref-bin \
  ttf-fantasque-sans-mono
