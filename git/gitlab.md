# gitlab installation
```bash
sudo docker run --detach \
    --hostname 192.168.1.109 \
    --publish 443:443 --publish 80:80 --publish 222:222 \
    --name gitlab \
    --restart always \
    --volume ~/gitlab/config:/etc/gitlab \
    --volume ~/gitlab/logs:/var/log/gitlab \
    --volume ~/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce:latest
```
### 重置管理员密码
- `docker exec -it gitlab bash`
- `gitlab-rails console`
- `user = User.where(username: ‘root’).first`
- `user.password = ‘password’`
- `user.save!`


### Reference Link
[jenkins gitlab docker](https://www.jianshu.com/p/8b1241a90d7a)