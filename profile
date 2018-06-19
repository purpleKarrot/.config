#!/bin/sh

export PATH=$HOME/.local/bin:$PATH

# XDG Base Directories
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share

if command -v systemctl >/dev/null 2>&1
then
  systemctl --user import-environment XDG_CONFIG_HOME
  systemctl --user import-environment XDG_CACHE_HOME
  systemctl --user import-environment XDG_DATA_HOME
fi

# workaround xdg violations
export CCACHE_DIR="$XDG_CACHE_HOME"/ccache
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc
export NMBGIT="$XDG_DATA_HOME"/notmuch/nmbug
export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat
export WINEPREFIX="$XDG_DATA_HOME"/wine
mkdir -p "$XDG_DATA_HOME"/newsbeuter/

# All my windows applications are 32bit
export WINEARCH=win32
export WINEDEBUG=-all,err+all

# Editor
export VISUAL=kak
export EDITOR=kak

# Go
export GOBIN=$HOME/.local/bin
export GOPATH=$HOME/go/ext:$HOME/go/local

# Source local profile (not in git)
if [ -e ".local_profile" ]
then
  source .local_profile
fi
