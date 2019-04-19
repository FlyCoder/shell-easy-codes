#!/bin/sh

last_key1=""
last_key2=""
file=$1
count=0
while read line || [[ -n "$line" ]]
do
    if [ ! -z "$line" ]; then
        let count+=1
        var=(${line//,/ })
        key1=${var[0]}
        key2=${var[1]}
        if [ "$key1" == "$last_key1" ]; then
            if [ "$key2" != "$last_key2" ]; then
                echo "diff key line key1=$key1, key2=$key2"
            fi
        fi
        if [ "$((count % 100000))" -eq "0" ]; then
            echo "pass 100000, $count"
        fi
        last_key1="$key1"
        last_key2="$key2"
    fi
done < $file
