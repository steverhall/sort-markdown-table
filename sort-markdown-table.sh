#!/bin/bash
for file in `ls $1`
do
    gawk -f sort-markdown-table.awk $file > $file.tmp
    if [ $? -eq 0 ]; then
        echo "Error sorting markdwon in " $file
        mv $file.tmp $file
    else
        rm $file.tmp
    fi
done