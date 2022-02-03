# k8s cluster with kubeadm

## 0.pre-requisites 

1. docker installation
2. kubeadm/kubelet/kubectl installation





## 1.Issue Summary

1. kubelet can't startup normally `systemctl status kubelet`

   view log via `journalctl -xefu kubelet` 

2. telnet 10.0.0.233 6443 
Trying 10.0.0.233...
telnet: Unable to connect to remote host: No route to host

```bash
iptables -L INPUT --line-numbers
# find out reject record such as below:
6    REJECT     all  --  anywhere             anywhere             reject-with icmp-host-prohibited

# workaround is delete the record
iptables -D INPUT 6

```
refer to [iptables config](https://www.jianshu.com/p/aef8903a88ee)

3. container runtime network not ready: NetworkReady=false reason:NetworkPluginNotReady message:docker: network plugin is not ready: cni config uninitialized

```bash
kubectl describe node <node Id> ## show above error msg.
# solution
kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml
```