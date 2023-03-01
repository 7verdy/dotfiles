brightnessctl set 5%-
brightness_percent=$(brightnessctl | grep -oP '\d+(?=%)')
notify-send -t 1500 -u normal -h string:x-canonical-private-synchronous:anything "Brightness: $brightness_percent%"