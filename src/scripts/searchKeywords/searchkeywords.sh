#!/bin/sh
#search keywords from a searching file
#keywords is being saved in a keywords file

keywords_file=$1
searching_file=$2
prefix=$3
while read line || [[ -n "${line}" ]]
do
    if [ ! -z "$line" ]; then
        word="$prefix$line"
        found=`grep $word $searching_file | head -n 1 | wc -l`
        if [ "$found" -eq "1" ]; then
            echo "1 $word"
        else
            echo "0 $word"
        fi
    fi
done < $keywords_file
