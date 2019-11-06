#!/bin/bash
# Date: Fri Oct  4 00:16:04 2019
# Author: January

# 该脚本用于将virualbox的vdi格式磁盘文件转换从qcow2格式（兼容格式）的磁盘文件
set -o errexit

oldname=$1
newname=${1%.*}.qcow2

usage="vdi2qcow <vdi image>"

if [ "$1" = "-h" ];then
    echo $usage
fi

if [ -z "$oldname" ] || [ -z "$newname" ];then
    echo "please input valid image name"
    exit 1
fi

if [ -e "$newname" ];then
    echo "$newname already exists, abort"
    exit 1
fi

qemu-img convert -f vdi -O qcow2 $oldname $newname
qemu-img amend -f qcow2 -o compat=0.10 $newname
echo "$newname generated"