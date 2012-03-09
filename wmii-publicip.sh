#!/bin/dash -f
# Determine the public IP of your default gateway, export it to the environment
# and echo it.

if [ -z "$WMII_PUBLIC_IP" ]; then
    export WMII_PUBLIC_IP="$(wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//')"
fi

echo "$WMII_PUBLIC_IP"
