# Set simlink for i3 config
ln -sf "$PWD/i3/config" "$HOME/.config/i3/config"
#Set simlink for polybar
mkdir -p "$HOME/.config/polybar/verdy"
ln -sf "$PWD/polybar/config" "$HOME/.config/polybar/config"

# Set simlink for rofi
mkdir -p "$HOME/.config/rofi/verdy"
ln -sf "$PWD/rofi/*" "$HOME/.config/rofi/verdy/"