cp -r $PWD/.zshrc $HOME/.zshrc
cp -r $PWD/.tmux.conf $HOME/.tmux.conf
cp -r $PWD/.alacritty.toml $HOME/.alacritty.toml
cp -r $PWD/.alacritty.toml $HOME/alacritty/alacritty.toml
cp -r $PWD/.wezterm.lua $HOME/.wezterm.lua

[ ! -d "$HOME/.config/nvim" ] && mkdir -p $HOME/.config/nvim/
cp -r -f $PWD/.config/nvim/* $HOME/.config/nvim

[ ! -d "$HOME/.local/share/fonts" ] && mkdir -p $HOME/.local/share/fonts
cp -r -f $PWD/.local/share/fonts/* $HOME/.local/share/fonts



