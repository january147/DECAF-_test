#!/bin/bash
# Date: Fri Oct  4 00:16:04 2019
# Author: January

oldname=$1
newname=${1%.*}.qcow2

if [ -z "$oldname" ] || [ -z "$newname" ];then
    echo "please input valid image name"
    exit 1
fi

qemu-img convert -f vdi -O qcow2 $oldname $newname
qemu-img amend -f qcow2 -o compat=0.10 $newname
echo "$newname generated"