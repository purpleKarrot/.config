#!/bin/sh

# XDG Base Directories
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share

systemctl --user import-environment XDG_CONFIG_HOME
systemctl --user import-environment XDG_CACHE_HOME
systemctl --user import-environment XDG_DATA_HOME

# workaround xdg violations
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc
export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat
export WINEPREFIX="$XDG_DATA_HOME"/wine
mkdir -p "$XDG_DATA_HOME"/newsbeuter/

# All my windows applications are 32bit
export WINEARCH=win32
export WINEDEBUG=-all

# Editor
export VISUAL=nvim
export EDITOR=$VISUAL

# python pip
export PATH=$HOME/.local/bin:$PATH

# Go
export GOBIN=$HOME/.local/bin
export GOPATH=$HOME/go/ext:$HOME/go/local

# use GNOME Keyring
export $(gnome-keyring-daemon -s)
