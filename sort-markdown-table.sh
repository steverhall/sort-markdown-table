#!/bin/bash
for file in "$@"
do
    gawk -f sort-markdown-table.awk $file > $file.tmp
    if [ $? -eq 0 ]; then
        mv $file.tmp $file
    else
        echo "Error sorting markdwon in " $file
        rm $file.tmp
    fi
done