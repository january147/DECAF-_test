#!/bin/bash
# Date: Thu Oct  3 23:30:19 2019
# Author: January

if [ -z "$1" ];then
    echo "please input the image needed converting"
    exit 1
fi

qemu-img amend -f qcow2 -o compat=0.10 "$1"