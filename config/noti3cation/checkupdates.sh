#!/usr/bin/env bash

updates=$(checkupdates)
if [ -n "$updates" ]; then
    notify-send "System updates" "$updates"
fi

updates=$(cower -u)
if [ -n "$updates" ]; then
    notify-send "AUR updates" "$updates"
fi
