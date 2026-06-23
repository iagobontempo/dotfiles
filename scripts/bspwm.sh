[ ! -d "$HOME/.config/bspwm" ] && mkdir -p $HOME/.config/bspwm/
cp -r -f $PWD/.config/bspwm/* $HOME/.config/bspwm

[ ! -d "$HOME/.config/sxhkd" ] && mkdir -p $HOME/.config/sxhkd/
cp -r -f $PWD/.config/sxhkd/* $HOME/.config/sxhkd

[ ! -d "$HOME/.config/rofi" ] && mkdir -p $HOME/.config/rofi/
cp -r -f $PWD/.config/rofi/* $HOME/.config/rofi

[ ! -d "$HOME/.config/polybar" ] && mkdir -p $HOME/.config/polybar/
cp -r -f $PWD/.config/polybar/* $HOME/.config/polybar

[ ! -d "$HOME/.config/Thunar" ] && mkdir -p $HOME/.config/Thunar/
cp -r -f $PWD/.config/Thunar/* $HOME/.config/Thunar

### UPDATE POLYBAR IN THE END
sh ./.config/polybar/launch.sh

