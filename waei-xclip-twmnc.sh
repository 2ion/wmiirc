#!/bin/bash
SEL=$(xclip -o | head -n1)

if [ -z "$SEL" ]; then
    exit
fi

if [ -n "$SEL" ]; then
    twmnc -d 15 -t "$(echo "$SEL" | head -n1)" -c "$(waei -q -e "$SEL")"
fi

waei -q -e "$SEL"


