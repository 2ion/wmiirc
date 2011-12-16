#!/bin/dash -f

weather -i EDDB -v \
    | sed -n \
        -e 's/^Weather: \(.*\)$/(\1)/p' \
        -e 's/^Temperature: .*(\(.*\))$/(\1)/p' \
        -e 's/^Relative Humidity: \(.*\)$/(phi \1)/p' \
        -e 's/^Sky conditions: \(.*\)$/(\1)/p' \
        -e 's/^Wind: .*(\(.*\)).*$/(\1)/p' \
    | tr '\n' ' '
