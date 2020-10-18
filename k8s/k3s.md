# K3S + Raspberry PI

- k3s installation

  ```bash
  # download bin package from office web site
  https://github.com/rancher/k3s/releases/latest
  
  # make a soft link 
  sudo ln -s $(pwd)/k3s /usr/bin/k3s
  ```



- Startup Master and Worker node

  - startup  server

    ```bash
    sudo k3s server &
    # Kubeconfig is written to /etc/rancher/k3s/k3s.yaml
    sudo k3s kubectl get node -o wide
    ```

  - startup worker node

    ```bash
    # On a different node run the below. NODE_TOKEN comes from /var/lib/rancher/k3s/server/node-token on your server
    sudo k3s agent --server https://myserver:6443 --token ${NODE_TOKEN}
    ```

  - Worker Node Example

    ```bash
    # for example:
    sudo k3s agent --server https://192.168.1.109:6443 --token K10327841cdae84f056bd3430a4a8ed7745bbee3a827c1247cccf5cf0a87adf04d2::server:0e1c9f296df9d3dae2fa4d24d6276832  --node-name rpi4
    ```

  

# Resource Cleanup

1. node 

   ```bash
   # list node
   sudo k3s kubectl get node
   # drain pod in node firstly before delete node
   sudo k3s kubectl drain rpi4 --delete-local-data --force --ignore-daemonsets
   # delete node
   sudo k3s kubectl delete node rpi4
   ```

2. pod

   ```bash
   # list pod
   sudo k3s kubectl get pod
   # delete
   sudo k3s kubectl delete pod <pod name>
   ```

   

# Q/A

1. `sudo k3s agent --server https://myserver:6443 --token ${NODE_TOKEN}` failed

    Adding debug handlers to kubelet server.
    F0919 20:17:58.385604   18269 server.go:166] listen tcp 0.0.0.0:10250: bind: address already in use

   > kubelet default port was 10250 already in use, so we need kill the process firstly 

   ```bash
   sudo ss -tpln |grep 10250
   # or 
   sudo netstat -tpln |grep 10250
   
   sudo kill -9 <pid from above queried>
   ```

2. Update node roles  from none to worker

   ```bash
   kubectl label node ${node} node-role.kubernetes.io/worker=worker
   ```

   

3. Reference: [frequencely Question and Answer](<https://docs.rancher.cn/docs/k3s/faq/_index>)

4. How to set image acceleration repository in China ?
    > dockerd and containerd Image acceleration configuration locate at difference place.
    - dockerd:`/etc/docker/daemon.json`
    - containerd:`/var/lib/rancher/k3s/agent/etc/containerd/config.toml`
    ```bash
    containerd config default
    # go to 
    cat /var/lib/rancher/k3s/agent/etc/containerd/config.toml
    cat /etc/containerd/config.toml
    ```

    Refer to : 
    - [k3s containerd image acceleration](https://blog.csdn.net/PlatoWG/article/details/107811162)
    - [k8s containerd image acceleration](https://github.com/containerd/cri/blob/master/docs/registry.md#configure-registry-endpoint)

# Reference Link

[k3s.io](k3s.io)

[latest release](https://github.com/rancher/k3s/releases/latest)

[k3s cn doc](https://docs.rancher.cn/k3s/)



