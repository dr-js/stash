# `certbot`

check: https://certbot.eff.org/

```shell script
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install certbot -y

sudo certbot certonly --standalone # fill out questions

ln -s -T /etc/letsencrypt/live CERT # optional
```

to renew cert
```shell script
sudo certbot certificates # check cert & expire time
sudo certbot renew --dry-run # or use

sudo certbot renew # do renew
```




