#!/bin/bash
# Date: Wed Oct  2 17:06:56 2019
# Author: January

set -o errexit

while getopts "12" choose
do
    if [ $choose != "?" ];then
        break
    fi
done

######################config###################
image="../image/ubuntu-12.04.5-server-i386.iso"
hd="../image/qemu_compat.img"
option="-monitor stdio -m 1024 -usbdevice tablet -netdev user,id=mynet,hostfwd=tcp::5022-:22 -device rtl8139,netdev=mynet"

hd2="../image/xp.qcow2"
# window7的安装镜像
cdrom="../image/windows7_32.iso"

# decaf++的qemu
machine1="../decaf/i386-softmmu/qemu-system-i386"
# 我电脑上安装的qemu
machine2=qemu-system-i386

if [ -z "$choose" ] || [ $choose == "?" ];then
    choose=1
fi
#####################end config###################

# run
if [ "$choose" = "1" ];then
    vncviewer 127.0.0.1:5900
    $machine1 $option -hda $hd2
# 启用kvm加速 
else
    $machine2 $option -hda $hd2 -enable-kvm 
fi
