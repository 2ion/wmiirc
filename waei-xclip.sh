#!/bin/bash
# Look up the string in the X clipboard in waei, then post the reply using a
# desktop notification.

SEL=$(xclip -o)
if [ -n "$SEL" ]; then
    notify-send -t 15 "$(echo "$SEL" | head -n1)" "$(waei -q -e "$SEL")"
fi
