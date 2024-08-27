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
  direnv
  eza
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
  brew install ${common_packages[*]} coreutils gh
  brew install --cask font-fantasque-sans-mono kitty
fi

command -v pacman &>/dev/null && sudo pacman -S --needed --noconfirm \
  ${common_packages[*]} \
  base-devel \
  abduco \
  acpi \
  aria2 \
  bc \
  cgdb \
  clang \
  dvtm \
  github-cli \
  gnome-keyring \
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
  man-db \
  man-pages \
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
  swaybg \
  swayidle \
  swaylock \
  ttf-fantasque-sans-mono \
  ttf-font-awesome \
  vdirsyncer \
  wl-clipboard \
  xdg-user-dirs \
  xdg-utils \
  yt-dlp \
  zathura-pdf-mupdf
