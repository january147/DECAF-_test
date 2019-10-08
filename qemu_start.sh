#!/bin/bash
# Date: Thu Oct  3 23:33:16 2019
# Author: January

qemu_type=qemu-system-i386
option="-monitor stdio -m 512"
hda="./new10g.qcow2"
hda2="./new5g.qcow2"
cdrom="/home/january/Downloads/windows7.iso"
cdrom2="/home/january/Downloads/ubuntu-12.04.4-desktop-i386.iso"

$qemu_type $option -cdrom $cdrom2 -hda $hda2 -boot once=d
