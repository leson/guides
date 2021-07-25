```
vim /etc/apt/sources.list.d/kubernetes.list

cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
EOF

curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add -

# docker login --username=i.leson@163.com registry.cn-hangzhou.aliyuncs.com

# kubeadm init 
kubeadm config images list

images=(  # 下面的镜像应该去除"k8s.gcr.io/"的前缀，版本换成上面获取到的版本
    kube-apiserver:v1.21.1
    kube-controller-manager:v1.21.1
    kube-scheduler:v1.21.1
    kube-proxy:v1.21.1
    pause:3.4.1
    etcd:3.4.13-0
    coredns/coredns:v1.8.0
)

# registry.aliyuncs.com/google_containers/coredns/coredns:v1.8.0

for imageName in ${images[@]} ; do
    docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
    docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName k8s.gcr.io/$imageName
    #docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
done

kubeadm config images pull


kubeadm config print init-defaults > kubeadm.config

docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/coredns/coredns:v1.8.0
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/coredns:v1.8.0


kubeadm init \
--apiserver-advertise-address=192.168.3.17 \
--image-repository registry.aliyuncs.com/google_containers \
--kubernetes-version v1.17.0 \
--service-cidr=10.96.0.0/12 \
--pod-network-cidr=10.244.0.0/16

```