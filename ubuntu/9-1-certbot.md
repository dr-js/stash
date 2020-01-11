# `certbot`

check: https://certbot.eff.org/

```shell script
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
# do not want the auto renew timer, this may casue multi-write to break shared cert folder
sudo apt-get install certbot -y \
  -o Dpkg::Options::="--path-exclude=/etc/cron*/*" \
  -o Dpkg::Options::="--path-exclude=/lib/systemd/system/*"

ls -l /etc/cron.d/cert* # should fail with no file
ls -l /lib/systemd/system/cert* # should fail with no file

sudo certbot certonly --standalone # fill out questions

ln -s -T /etc/letsencrypt/live CERT # optional
```

to renew cert
```shell script
sudo certbot certificates # check cert & expire time
sudo certbot renew --dry-run # or use this for cert check
sudo certbot renew # do renew all cert
sudo certbot renew --cert-name DOMAIN.NAME.HERE # do renew single cert
```
