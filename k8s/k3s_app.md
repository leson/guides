# deployment
## nginx-deployment.yml

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name:  nginx-deployment
spec:
  selector:
    matchLabels:
      app: web_app
  replicas: 1
  template:
    metadata:
      labels:
        app:  web_app
    spec:
      containers:
      - name:  nginx
        image:  nginx:latest
```



## apply

```bash
sudo k3s kubectl apply -f nginx-deployment.yml
```





## verify

```bash
sudo k3s kubectl get pod -o wide

curl -v <ip>
```



# service

## httpd-svc.yml

```yaml
apiVersion: v1
kind: service

```

