#!/usr/bin/env bash

dir="$HOME/.config/rofi/verdy"

rofi -no-lazy-grab -show drun \
-modi run,drun,window \
-theme $dir/theme.rasi
