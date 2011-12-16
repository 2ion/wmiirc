#!/bin/bash -f
# MPD status notification
# Copyright (c) 2011 Jens Oliver John <jens.o.john@fu-berlin.de>

MPC_FORMAT='%artist%_%album%_%title%'
DATA=`mpc -f ${MPC_FORMAT}`
STATUS=`echo "$DATA" | sed -n -e '2s:^\[\(.*\)\].*$:\1:p'`
TRACKI=`echo -n "$DATA" | head -n1`

TITLE="

echo $TITLE

