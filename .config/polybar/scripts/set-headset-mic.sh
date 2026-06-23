#!/bin/sh
# Set headset mic because of google-chrome fucking turning volume down

card=$(eval cat /proc/asound/cards | grep "\[Headset" | awk -F'[][]' '{ print $1 }')
if [ -n "$card" ]; then
    amixer -c $card set Mic 100
fi
