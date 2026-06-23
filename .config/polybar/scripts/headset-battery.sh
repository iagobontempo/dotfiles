#!/bin/sh

baterry=$(eval headsetcontrol -b | grep Level | cut -d ':' -f 2 | cut -d '%' -f 1)
if [ "$baterry" -gt 0 ]; then
    echo $baterry %
else 
    echo "OFF"
fi
