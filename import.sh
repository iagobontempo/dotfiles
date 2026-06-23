#!/bin/sh

printf "Choose environment (niri/bsp): "
read -r compositor 

case "$compositor" in
    niri)
        echo "Importing niri..."
        SCRIPT="scripts/niri-import.sh"
        ;;
    bsp)
        echo "Importing bspwm..."
        SCRIPT="scripts/bspwm-import.sh"
        ;;
    *)
        echo "Wrong option. Allowed: 'niri' or 'bsp'."
        exit 1
        ;;
esac

sh "$SCRIPT"
echo "Imported..."
