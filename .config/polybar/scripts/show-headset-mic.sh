#!/bin/sh
# Finds out the card that contains my headset mic and show the volume

baterry=$(eval headsetcontrol -b | grep Level | cut -d ':' -f 2 | cut -d '%' -f 1)
card=$(eval cat /proc/asound/cards | grep "\[Headset" | awk -F'[][]' '{ print $1 }')
if [ "$baterry" -gt 0 ] && [ -n "$card" ] ; then
    amixer -c $card get Mic | grep Mono: |  awk -F'[][]' '{ print $2 }'
else 
    echo "OFF"
fi


