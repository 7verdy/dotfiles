#!/bin/bash

amixer sset Master 5%+ > /dev/null

vol=`amixer get Master | grep -m 1 "\[on\]" | sed -Ee 's/.*\[(.+)%.*/\1/'`
notify-send -t 1500 -u normal -h string:x-canonical-private-synchronous:anything "current volume: $vol%"
