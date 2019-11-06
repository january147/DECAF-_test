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
hd="../image/qemu_compat.img"
hd2="../image/xp.qcow2"
info_display="-monitor stdio"
mem="-m 1024"
mouse="-usbdevice tablet"
network="-netdev user,id=mynet,hostfwd=tcp::5022-:22 -device rtl8139,netdev=mynet"
kvm="-enable-kvm"

# window7的安装镜像
cdrom="../image/windows7_32.iso"
# ubuntu安装镜像
image="../image/ubuntu-12.04.5-server-i386.iso"
# decaf++的qemu
machine1="../decaf/i386-softmmu/qemu-system-i386"
# 我电脑上安装的qemu
machine2=qemu-system-i386
# 默认启动DECAF++虚拟机
if [ -z "$choose" ] || [ $choose == "?" ];then
    choose=1
fi
#####################end config###################

# run
if [ "$choose" = "1" ];then
    # DECAF++用的qemu比较老，需要安装VNCviewer来显示界面
    vncviewer 127.0.0.1:5900
    option="$info_display $mem $mouse $network"
    $machine1 $option -hda $hd2
else
    # 启用kvm加速 
    option="$info_display $mem $mouse $network $kvm"
    $machine2 $option -hda $hd2
fi
