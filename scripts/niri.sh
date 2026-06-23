[ ! -d "$HOME/.config/niri" ] && mkdir -p $HOME/.config/niri/
cp -r -f $PWD/.config/niri/* $HOME/.config/niri

[ ! -d "$HOME/.config/DankMaterialShell" ] && mkdir -p $HOME/.config/DankMaterialShell
cp -r $PWD/.config/DankMaterialShell/* $HOME/.config/DankMaterialShell

[ ! -d "$HOME/.config/fuzzel" ] && mkdir -p $HOME/.config/fuzzel
cp -r $PWD/.config/fuzzel/* $HOME/.config/fuzzel

