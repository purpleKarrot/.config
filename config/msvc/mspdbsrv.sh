#!/bin/sh

export WINEARCH=win32
export WINEDEBUG=-all
export WINEPREFIX="$XDG_DATA_HOME"/wine

wineserver -p
wine mspdbsrv.exe -start -shutdowntime -1
