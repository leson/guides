```bash
virt-install \
    --name=k8s-master \
    --memory=1024,maxmemory=2048 \
    --vcpus=1,maxvcpus=2 \
    --os-type=linux \
    --os-variant=rhel7 \
    --location=/root/k8s/CentOS-7-x86_64-DVD-1810.iso \
    --disk path=/home/leson/k8s/kvm_img/k8s-master.img,size=10 \
    --bridge=br0 \
    --graphics=none \
    --console=pty,target_type=serial  \
    --extra-args="console=tty0 console=ttyS0"
```

