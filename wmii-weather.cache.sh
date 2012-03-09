#!/bin/bash
# Caches the output of scripts/programs querying the internet in order to reduce
# network activity / delay invocation independent from the wmiirc status
# refresh.

WRITER="/home/$USER/.wmii/wmii-weather.sh"
FIFO="/home/$USER/.wmii/weather.cache"
EXPIRE=300

if [ -r "$FIFO" ]; then
    FIFO_AGE="$(( $(date +%s)-$(stat -c %Z $FIFO) ))"
    if [ $FIFO_AGE -gt $EXPIRE ]; then
        $WRITER>$FIFO
    fi
else
    $WRITER>$FIFO
fi

cat $FIFO
