# kubernetes 
[concepts](https://kubernetes.io/docs/concepts/)

## mirrors of Aliyun
[alibaba open source mirror site](https://opsx.alibaba.com/)

## configuration
Example for debian/ubuntu
```
apt-get update && apt-get install -y apt-transport-https
curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add - 
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
EOF  
```
more mirror config approach please refer to below link:
[kubernetes mirror of alibaba](https://opsx.alibaba.com/mirror?lang=en-US)

## installation 
```bash
apt-get update
apt-get install -y kubeadm kubectl kubelet
```
- validation installation
```
kubeadm help
kubectl help
```
actually follow the manual of official we can getting start our tour of kubenetes.
enjoy :)
