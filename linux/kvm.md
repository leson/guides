# [kvm install](https://blog.51cto.com/zero01/2083896) some OS via command line.


## Command for installation kvm
```bash
virt-install \
    --name=k8s-master \
    --memory=1024,maxmemory=2048 \
    --vcpus=1,maxvcpus=2 \
    --os-type=linux \
    --os-variant=rhel7 \
    --location=/root/k8s/CentOS-7-x86_64-DVD-1810.iso \
    --disk path=/home/kvm_data/k8s-master.img,size=10 \
    --bridge=br0 \
    --graphics=none \
    --console=pty,target_type=serial  \
    --extra-args="console=tty0 console=ttyS0"
```

- --name 指定虚拟机的名称
- --memory 指定分配给虚拟机的内存资源大小 maxmemory 指定可调节的最大内存资源大小，因为KVM支持热调整虚拟机的资源
- --vcpus 指定分配给虚拟机的CPU核心数量 maxvcpus 指定可调节的最大CPU核心数量
- --os-type 指定虚拟机安装的操作系统类型
- --os-variant 指定系统的发行版本
- --location 指定ISO镜像文件所在的路径，支持使用网络资源路径，也就是说可以使用URL
- --disk path 指定虚拟硬盘所存放的路径及名称，size 则是指定该硬盘的可用大小，单位是G
- --bridge 指定使用哪一个桥接网卡，也就是说使用桥接的网络模式
- --graphics 指定是否开启图形
- --console 定义终端的属性，target_type 则是定义终端的类型
- --extra-args 定义终端额外的参数

## commonly used command
```bash
virsh list --all
virsh console <vm name>     # enter to vm
ctrl+]                      # exit vm
virsh shutdown <vm name>    # shutdown vm
virsh start <vm name>       # start vm
virsh destroy <vm name>     # force to shutdown vm
virsh undefine <vm name>    # delete vm
```

## ISSUE:
1. can't open iso file permission denny
    solution: change `/etc/libvirt/qemu.conf` refer to [this link](https://blog.csdn.net/a19860903/article/details/77882647)