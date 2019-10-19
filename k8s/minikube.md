# Minikube 

## [minikube + kvm](https://computingforgeeks.com/how-to-run-minikube-on-kvm/) 
> Minikube run kubernetes clusters on kvm 

### Prerequisites preparation
1. [minikube](https://github.com/kubernetes/minikube/releases) and [kubectl](https://github.com/kubernetes/kubectl/releases)
2. [docker-machine](https://docs.docker.com/machine/) 
3. [kvm and Qemu and Libvirt](https://computingforgeeks.com/install-kvm-centos-rhel-ubuntu-debian-sles-arch/)
4. docker-machine-driver-kvm2



### test minikube 
```bash
minikube start --vm-driver kvm2
```