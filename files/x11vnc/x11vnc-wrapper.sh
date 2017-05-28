#!/bin/sh

AUTH_FILE=$(ps -C X,Xorg -o command= | grep -o '\B[-]auth\s*/run\S*sddm\S*' | cut -d ' ' -f 2)
exec /usr/bin/x11vnc -auth $AUTH_FILE $@
