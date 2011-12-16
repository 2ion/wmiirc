#/bin/dash -f
tmux new-window -kn MPD "watch -tn1 mpc -f \"%artist%\ /\ %album%\ /\ %title%\"" \; split-window -hp 45 'watch -tn1 lua /home/joj/.wmii/mpdmon-playlist.lua' \; split-window -vp 50 -t :.left
