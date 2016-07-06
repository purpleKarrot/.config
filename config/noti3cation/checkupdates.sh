#!/usr/bin/env bash

updates=$(checkupdates)
if [ -n "$updates" ]; then
    notify-send "System updates" "$updates"
fi
