#!/bin/bash
# Date: Thu Oct  3 23:30:19 2019
# Author: January

# 该脚本用于将qcow2格式的磁盘文件转换到老版本的兼容格式（DECAF++中的qemu就用的兼容格式）

set -o errexit

if [ -z "$1" ];then
    echo "please input the image needed converting"
    exit 1
fi

qemu-img amend -f qcow2 -o compat=0.10 "$1"