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
  git-delta
  jq
  kakoune
  ninja
  ripgrep
  tig
)

if [ "$(uname -s)" == "Darwin" ]
then
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n
  xcode-select --install
  sudo port install ${common_packages[*]}
  sudo port install coreutils
  sudo port install gh # github-cli
  sudo port install direnv
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
