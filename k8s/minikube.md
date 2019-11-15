# kubernetes Manage by Minikube 

## [minikube + kvm](https://computingforgeeks.com/how-to-run-minikube-on-kvm/) 
> Minikube run kubernetes clusters on kvm 

### Prerequisites preparation
1. [minikube](https://github.com/kubernetes/minikube/releases) and [kubectl](https://github.com/kubernetes/kubectl/releases)
2. [docker-machine](https://docs.docker.com/machine/) 
3. [kvm and Qemu and Libvirt](https://computingforgeeks.com/install-kvm-centos-rhel-ubuntu-debian-sles-arch/)
4. [docker-machine-driver-kvm2](https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2)



### `minikube` 
> [installation of minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)


```bash
# start clusters on VM by minikube
minikube start --vm-driver kvm2

minikube ssh

minikube stop

minikube addons list

minikube dashboard --url

minikube dashboard

minikube service hello-minikube --url

# minikube delete
```

> `virsh`
```bash
sudo virsh list
```

> `kubectl`
```bash
kubectl cluster-info

kubectl config view

kubectl get nodes

kubectl get events

kubectl get services

kubectl describe services <Service-name>

```

Reference Link:
1. [learning minikube](https://kubernetes.io/docs/setup/learning-environment/minikube/)

# Issue Report
## 1. `ErrImagePull` or `imagepullbackoff`
`kubectl get pods` status was `ErrImagePull` or 
Track:
```bash
kubectl cluster-info
kubectl get pods
kubectl describe pod hello-node
minikube docker-env
```

solution: setup proxy while start the kubernets clusters
> minikube start --docker-env HTTP_PROXY=<my proxy> --docker-env HTTPS_PROXY=<my proxy> --docker-env NO_PROXY=192.168.99.0/24
```bash
#append proxy in order we can pull images.
minikube start --vm-driver kvm2 --docker-env HTTP_PROXY=http://192.168.1.6:10809

# or From china,we can append the image repository as below
minikube start --vm-driver kvm2 --image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers \
--image-mirror-country=cn
```
- http://192.168.1.6:10809  : 翻墙代理IP:port

refer to : [minikube start guide](https://k8smeetup.github.io/docs/getting-started-guides/minikube/)

## 2. `kubectl get pods` No resources found.
> trace
```bash
kubectl get namespaces
kubectl get pods --all-namespaces
```
