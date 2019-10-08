#!/bin/bash
# Date: Thu Oct  3 23:18:05 2019
# Author: January

size=$1
name=$2
type=qcow2

if [ -z "$size" ];then
    echo "please input size as the first argument"
    exit 1
fi
if [ -z "$name"];then
    name="new$size.$type"
fi

qemu-img create -f $type $name $size
if [ $? -ne 0 ];then
    echo "failed"
    exit 1
fi
echo "$name generated"
