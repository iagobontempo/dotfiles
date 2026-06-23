#!/bin/sh

if headsetcontrol -b | grep -q 'No supported device found'; then
    exit 1  # Failed (headset connected, hide the module)
else
    exit 0  # Successful (headset not connected, show the module)
fi

