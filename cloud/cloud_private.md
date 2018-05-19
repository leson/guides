#

## Raspberry PI  install nextcloud 

```bash
docker run -d -p 4443:4443 -p 443:443 -p 80:80 -v ncdata:/data --name nextcloudpi ownyourbits/nextcloudplus-armhf $DOMAIN
```
> $DOMAIN was that your need to accessed domain name or IP.

