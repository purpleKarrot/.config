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

if [ "$(uname -s)" == "Darwin" ]
then
  xcode-select --install
  softwareupdate --install --all
  softwareupdate --install-rosetta --agree-to-license
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew tap homebrew/cask-fonts
  brew install ${common_packages[*]} coreutils direnv gh
  brew install --cask font-fantasque-sans-mono kitty
fi

command -v pacman &>/dev/null && sudo pacman -S --needed --noconfirm \
  ${common_packages[*]} \
  base-devel \
  abduco \
  acpi \
  aria2 \
  cgdb \
  clang \
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
