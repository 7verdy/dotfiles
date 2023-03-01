SCRIPT_WD="$(dirname $(realpath "$BASH_SOURCE"))"

# Copy the background to ~/Pictures to be used by i3
cp -r "$SCRIPT_WD/img/." "$HOME/Pictures/"

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

# Set symlink for bashrc
ln -sf "$SCRIPT_WD/bashrc" "$HOME/.bashrc"

# Set symlink for profile
ln -sf "$SCRIPT_WD/profile" "$HOME/.profile"

# Set symlink for vimrc
ln -sf "$SCRIPT_WD/vimrc" "$HOME/.vimrc"

# Symlink volumes scripts in /bin to be used by i3
sudo mkdir -p "/bin/volume_scripts"
sudo ln -sf "$SCRIPT_WD/volume_scripts/mute.sh" "/bin/volume_scripts/mute.sh"
sudo ln -sf "$SCRIPT_WD/volume_scripts/volume-decrease.sh" "/bin/volume_scripts/volume-decrease.sh"
sudo ln -sf "$SCRIPT_WD/volume_scripts/volume-increase.sh" "/bin/volume_scripts/volume-increase.sh"
sudo ln -sf "$SCRIPT_WD/volume_scripts/volume-get.sh" "/bin/volume_scripts/volume-get.sh"

# Symlink brightness scripts in /bin to be used by i3
sudo mkdir -p "/bin/brightness_scripts"
sudo ln -sf "$SCRIPT_WD/brightness_scripts/brightness-up.sh" "/bin/brightness_scripts/brightness-up.sh"
sudo ln -sf "$SCRIPT_WD/brightness_scripts/brightness-down.sh" "/bin/brightness_scripts/brightness-down.sh"

# Symlink dunst config
mkdir -p "$HOME/.config/dunst"
ln -sf "$SCRIPT_WD/dunst/dunstrc" "$HOME/.config/dunst/dunstrc"