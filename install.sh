SCRIPT_WD="$(dirname $(realpath "$BASH_SOURCE"))"

# Copy the background to ~/Pictures to be used by i3
cp "$SCRIPT_WD/img/bloom.png" "$HOME/Pictures/"

# Set symlink for i3 config
ln -sf "$SCRIPT_WD/i3/config" "$HOME/.config/i3/config"
# Set symlink for polybar
mkdir -p "$HOME/.config/polybar/verdy"
ln -sf "$SCRIPT_WD/polybar/config.ini" "$HOME/.config/polybar/verdy/config.ini"

# Set symlink for rofi
mkdir -p "$HOME/.config/rofi/verdy"
ln -sf "$SCRIPT_WD/rofi/theme.rasi" "$HOME/.config/rofi/verdy/theme.rasi"
ln -sf "$SCRIPT_WD/rofi/colors.rasi" "$HOME/.config/rofi/verdy/colors.rasi"
ln -sf "$SCRIPT_WD/rofi/launcher.sh" "$HOME/.config/rofi/verdy/launcher.sh"
