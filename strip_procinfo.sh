#!/bin/bash
# Date: Sat Oct  5 16:38:13 2019
# Author: January

while read line
do
    new_line=${line#\[*\]}
    echo $new_line
done
