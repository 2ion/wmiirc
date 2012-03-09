#!/bin/bash
SESSIONLIST="$(mktemp)"
TARGET_SESSION=$({
    for tmux_session in $(tmux ls | cut -d':' -f1); do
        echo "$tmux_session"
    done
} | tee >(wimenu) "$SESSIONLIST")
if grep -q "$TARGET_SESSION" "$SESSIONLIST"; then
#   urxvt -e tmux att -t "$TARGET_SESSION" &
    xmessage "Session $TARGET_SESSION exists."
else
#   urxvt -e tmux new -s "$TARGET_SESSION" &
    xmessage "Session $TARGET_SESSION does not exist."
fi



