# introduce
- [official docker jenkins image](https://hub.docker.com/_/jenkins)

# installation 
```bash
mkdir -p 
docker run -d \
--name jenkins_server \
-v /var/run/docker.sock:/var/run/docker.sock \
-v jenkins_home:/var/jenkins_home \
-p 39080:8080 \
-p 50000:50000 \
jenkins/jenkins
```

## jenkins blueocean install with docker
```bash
docker run -p 8888:8080 jenkinsci/blueocean:latest
```
access link [localhost:8888/blue](http://localhost:8888/blue)

### issue
- No such plugin: cloudbees-folder
access:[localhost:8888/restart](localhost:8888/restart)

- forget the admin's password 
`cat ~/.jenkins/secrets/initialAdminPassword`

## plugins install

