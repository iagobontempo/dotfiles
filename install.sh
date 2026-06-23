#!/bin/sh

printf "Choose environment (niri/bsp): "
read -r compositor 

case "$compositor" in
    niri)
        echo "Installing niri..."
        SCRIPT="scripts/niri.sh"
        ;;
    bsp)
        echo "Installing bspwm..."
        SCRIPT="scripts/bspwm.sh"
        ;;
    *)
        echo "Wrong option. Allowed: 'niri' or 'bsp'."
        exit 1
        ;;
esac

echo "Installing common..."
sh scripts/common.sh 
sh "$SCRIPT"
echo "Finished..."
