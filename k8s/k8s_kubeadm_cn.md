## add aliyun software source
```bash
cat /etc/apt/sources.list.d/kubernetes.list

cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
EOF
```

## add aliyun apt key
```bash
curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add -

# docker login --username=i.leson@163.com registry.cn-hangzhou.aliyuncs.com
```

## kubeadm prerequsites 
```bash
kubeadm config images list

images=(  # 下面的镜像应该去除"k8s.gcr.io/"的前缀，版本换成上面获取到的版本
    kube-apiserver:v1.22.0 
    kube-controller-manager:v1.22.0 
    kube-scheduler:v1.22.0 
    kube-proxy:v1.22.0 
    pause:3.5 
    etcd:3.5.0-0 
    coredns:v1.8.4
)

# coredns need be handle specially
# registry.aliyuncs.com/google_containers/coredns/coredns:v1.8.4

for imageName in ${images[@]} ; do
    docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
    docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName k8s.gcr.io/$imageName
    #docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
done

kubeadm config images pull


# kubeadm config print init-defaults > kubeadm.config

# docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/coredns/coredns:v1.8.4
# docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/coredns:v1.8.4
```

## init kubernetes cluster
```bash
swapoff -a

kubeadm init \
--pod-network-cidr=172.100.0.0/16 

```

## kubectl authentication
```bash
# if root account
export KUBECONFIG=/etc/kubernetes/admin.conf

# if non-root account
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf
$HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
```

## verify via kubectl
```bash
kubectl get svc
```

## Reference
[Full Steps](https://blog.csdn.net/weixin_30599769/article/details/99213805)