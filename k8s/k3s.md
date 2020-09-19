# K3S + Raspberry PI

```bash
sudo k3s server &
# Kubeconfig is written to /etc/rancher/k3s/k3s.yaml
sudo k3s kubectl get node

# On a different node run the below. NODE_TOKEN comes from /var/lib/rancher/k3s/server/node-token
# on your server
sudo k3s agent --server https://myserver:6443 --token ${NODE_TOKEN}
```





# Reference Link

[k3s.io](k3s.io)

[latest release](https://github.com/rancher/k3s/releases/latest)

[k3s cn doc](https://docs.rancher.cn/k3s/)



