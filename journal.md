问题:'image' uses a qcow2 feature which is not supported by this qemu version: QCOW version 3

(磁盘文件格式不兼容)

```
qemu-img amend -f qcow2 -o compat=0.10 test.qcow2
```



问题:读取不到网卡

使用`ip link`查看可用网卡

去`/etc/network/interfaces`中正确配置网卡



问题：同宿主机通信

使用qemu的`hostfwd`选项开启端口转发



问题：启动vmi后decaf在启动系统的过程中出现segmentation fault

不知道怎么办，目前测试只有ubuntu12.04桌面版能启动起来，然后开启了VMI后就崩溃了



问题：鼠标不同步怎么办

qemu启动时加入如下选项

```
-usbdevice tablet
```





