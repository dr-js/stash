# `certbot`

check: https://certbot.eff.org/

```shell script
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:certbot/certbot
sudo apt update
# do not want the auto renew timer, this may casue multi-write to break shared cert folder
sudo apt install certbot -y \
  -o Dpkg::Options::="--path-exclude=/etc/cron*/*" \
  -o Dpkg::Options::="--path-exclude=/lib/systemd/system/*"

# to make sure the auto renew script is dropped 
ls -l /etc/cron.d/cert* # should fail with no file
ls -l /lib/systemd/system/cert* # should fail with no file

# optional quick symlink
ln -sfT /etc/letsencrypt/live easy/access/to/CERT
```

```shell script
# to request a new cert for a domain:
sudo certbot certonly --standalone # fill out questions

# to check existing cert:
sudo certbot certificates # check cert & expire time
sudo certbot renew --dry-run # or use this for cert check

# to request cert renew: (auto renew is disabled above)
sudo certbot renew # renew all cert
sudo certbot renew --cert-name DOMAIN.NAME.HERE # renew single cert
```
