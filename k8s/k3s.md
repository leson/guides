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

  

  

# Q/A

1. Adding debug handlers to kubelet server.
   F0919 20:17:58.385604   18269 server.go:166] listen tcp 0.0.0.0:10250: bind: address already in use

   > kubelet default port was 10250 already in use, so we need kill the process firstly 

   ```bash
   sudo ss -tpln |grep 10250
   # or 
   sudo netstat -tpln |grep 10250
   
   sudo kill -9 <pid from above queried>
   ```

   



# Reference Link

[k3s.io](k3s.io)

[latest release](https://github.com/rancher/k3s/releases/latest)

[k3s cn doc](https://docs.rancher.cn/k3s/)



