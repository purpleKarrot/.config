#!/bin/sh

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

# OSX
if [ $(uname -s) = "Darwin" ]
then
  function nproc {
    sysctl -n hw.ncpu
  }
fi

# Use all cores
export MAKEFLAGS="-j$(echo $(nproc) + 1 | bc) -l$(nproc)"

# Source local profile (not in git)
if [ -e ".local_profile" ]
then
  source .local_profile
fi
