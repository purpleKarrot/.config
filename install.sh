#!/bin/sh

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
  ~/.local/bin

common_packages=(
  bat
  ccache
  cmake
  diff-so-fancy
  exa
  fd
  fish
  fzf
  jq
  kakoune
  ninja
  ripgrep
  tig
)

if command -v brew &>/dev/null
then
  brew install ${common_packages[*]}
  brew install coreutils
  brew tap homebrew/cask-fonts
  brew cask install font-fantasque-sans-mono
  brew cask install kitty
  brew cask install presentation
fi

command -v pacman &>/dev/null && sudo pacman -S --needed --noconfirm \
  ${common_packages[*]} \
  base-devel \
  abduco \
  acpi \
  aria2 \
  cgdb \
  clang \
  colordiff \
  dvtm \
  github-cli \
  go \
  i3blocks \
  imagemagick \
  imv \
  isync \
  kak-lsp \
  khal \
  khard \
  kitty \
  libsecret \
  mako \
  meson \
  mpd \
  mpv \
  ncdu \
  neomutt \
  newsboat \
  noto-fonts \
  noto-fonts-emoji \
  openssh \
  pacman-contrib \
  pass \
  pavucontrol \
  pulseaudio \
  rmlint \
  sway \
  swayidle \
  swaylock \
  ttf-fantasque-sans-mono \
  ttf-font-awesome \
  vdirsyncer \
  wl-clipboard \
  xdg-user-dirs \
  youtube-dl \
  zathura-pdf-mupdf
