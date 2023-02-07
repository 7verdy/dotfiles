#!/bin/bash

vol=`amixer get Master | grep -m 1 "\[on\]" | sed -Ee 's/.*\[(.+)%.*/\1/'`
CURRENT_STATE=`amixer get Master | egrep -m 1 'Playback.*?\[o' | egrep -o '\[on\]'`
if [[ "$CURRENT_STATE" == "[on]" ]]; then
    notify-send -t 1500 -u normal -h string:x-canonical-private-synchronous:anything "sound muted - current volume: $vol%"
    amixer set Master mute
else
    vol=`amixer get Master | grep -m 1 "\[off\]" | sed -Ee 's/.*\[(.+)%.*/\1/'`
    notify-send -t 1500 -u normal -h string:x-canonical-private-synchronous:anything "sound unmuted - current volume: $vol%"
    amixer set Master unmute
fi
