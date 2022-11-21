#!/bin/bash

touch out.text
f="task5.txt"
curr=$(<"$f")

inotifywait -m -e modify "$f" --format "%e" | while read -r event; do
    if [ "$event" == "MODIFY" ]; then
        prev="$curr"
        curr=$(<"$f")
        [ "$curr" == "$prev" ] || echo "$(date) there is new modify"  > out.text
    fi
done
