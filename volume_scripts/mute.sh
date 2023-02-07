#!/bin/bash

CURRENT_STATE=`amixer get Master | egrep -m 1 'Playback.*?\[o' | egrep -o '\[on\]'`
echo "$CURRENT_STATE"
if [[ "$CURRENT_STATE" == "[on]" ]]; then
    notify-send -t 1500 -u normal -h string:x-canonical-private-synchronous:anything "Sound muted"
    amixer set Master mute
else
    notify-send -t 1500 -u normal -h string:x-canonical-private-synchronous:anything "Sound unmuted"
    amixer set Master unmute
fi
