#!/bin/bash
SEL=$(xclip -o)
if [ -n "$SEL" ]; then
    notify-send -t 15 "$(echo "$SEL" | head -n1)" "$(waei -q -e "$SEL")"
fi
