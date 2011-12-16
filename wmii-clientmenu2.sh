#!/bin/dash -f
TARGET=$({
for client in $(wmiir ls /client | grep 0x); do
        echo "\"$(wmiir read /client/${client}props | cut -d: -f2,3 | sed 's/^\(.*\):\(.*\)$/\1 (\2)/g'):$(wmiir read /client/${client}tags | cut -d+ -f1)\":${client%%/}"
done
} | xargs wmii9menu)

wmiir xwrite /ctl view $(echo $TARGET | cut -d: -f1)
wmiir xwrite /tag/sel/ctl select client $(echo $TARGET | cut -d: -f2)

