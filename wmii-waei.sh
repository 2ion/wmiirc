#!/bin/bash
for TERM in $(</dev/null wimenu); do
    notify-send "$TERM" "$(waei -q -e "$TERM")"
done

