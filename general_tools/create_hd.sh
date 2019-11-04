#!/bin/bash
# Date: Thu Oct  3 23:18:05 2019
# Author: January

set -o errexit

# 该脚本用于创建一个qcow2格式（兼容格式）的磁盘文件

size=$1
name=$2
type=qcow2

usage="create_hd <size> [<name>]"

if [ "$1" = "-h" ];then
    echo $usage
    exit 0
fi

if [ -z "$size" ];then
    echo "please input size as the first argument"
    exit 1
fi

if [ -z "$name" ];then
    name="new$size.$type"
fi

if [ -e "$name" ];then
    echo "$name already exists, abort"
    exit 0
fi

qemu-img create -f $type $name $size
if [ $? -ne 0 ];then
    echo "failed to create"
    exit 1
fi

qemu-img amend -f qcow2 -o compat=0.10 $name
if [ $? -ne 0 ];then
    echo "failed to make it compatible form"
    exit 1
fi
echo "$name generated"
