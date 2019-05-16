#!/bin/sh

rm -rf ~/.config
ln -s ~/Projects/dotfiles/config ~/.config

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

command -v brew &>/dev/null && brew install \
  ccache \
  cmake \
  coreutils \
  diff-so-fancy \
  fd \
  fzf \
  hub \
  kakoune \
  ninja \
  ripgrep \
  tig

command -v pacman &>/dev/null && sudo pacman -S --needed --noconfirm \
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
  fish \
  fzf \
  go \
  hub \
  i3blocks \
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
  sway \
  swayidle \
  swaylock \
  termite \
  texlive-latexextra \
  texlive-pictures \
  tig \
  tree \
  ttf-fira-mono \
  ttf-fira-sans \
  ttf-font-awesome \
  vdirsyncer \
  wl-clipboard \
  xdg-user-dirs \
  youtube-dl \
  zathura-pdf-mupdf

command -v yay &>/dev/null && yay -S \
  ccls \
  pandoc-bin \
  pandoc-citeproc-bin \
  pandoc-crossref-bin \
  ttf-fantasque-sans-mono
