#!/bin/bash
# Look if there are running tmux sessions. If so, attach an urxvt to each of
# them. If not, spawn a default set of tmux sessions.

DEFAULT_SESSIONS=('dev' 'mail' 'av' 'misc')
RUNNING=0
for SESSION in `tmux ls | awk -F':' '{print $1}'`; do
    urxvt -e tmux att -t $SESSION &
    RUNNING=1
done
if [ $RUNNING -ne 1 ]; then
    for SESSION in ${DEFAULT_SESSIONS[@]}; do
        urxvt -e tmux new -s $SESSION &
    done
fi


