#

## Raspberry PI  install nextcloud 

```bash
docker run -d -p 4443:4443 -p 443:443 -p 80:80 -v ncdata:/data --name nextcloudpi ownyourbits/nextcloudplus-armhf $DOMAIN
```
> DOMAIN should be your trusted domain: the URL or IP that will be used to access.
> Any folder can be used instead of the volume ncdata to hold the Nextcloud data.

