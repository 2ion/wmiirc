#!/bin/dash -f
{
    while true; do
        acpitool -b | sed 's/%/ /g'| gawk '
            {
                if( $5 < 20.0 )
                   system("notify-send -t 1000 -u critical \"wmii-critical\" \"Power is low, you go to sleep, therefore.\"");
            }
        '
        sleep 5s
    done
}&

