# common shadowsocks setup

```shell
sudo mkdir -p /opt/dr/
sudo chmod 777 /opt/dr/
mkdir -p /opt/dr/cert/

mkdir -p /opt/dr/cert/etc-letsencrypt/
mkdir -p /opt/dr/cert/var-lib-letsencrypt/

tee /opt/dr/cert/ADD.sh <<- 'EOM'
sudo docker run -it --rm \
  -v "/opt/dr/cert/etc-letsencrypt:/etc/letsencrypt" \
  -v "/opt/dr/cert/var-lib-letsencrypt:/var/lib/letsencrypt" \
  -p 80:80 \
  certbot/certbot certonly --standalone
EOM
tee /opt/dr/cert/LIST.sh <<- 'EOM'
sudo docker run -it --rm \
  -v "/opt/dr/cert/etc-letsencrypt:/etc/letsencrypt" \
  -v "/opt/dr/cert/var-lib-letsencrypt:/var/lib/letsencrypt" \
  certbot/certbot certificates
EOM
tee /opt/dr/cert/RENEW.sh <<- 'EOM'
sudo docker run -it --rm \
  -v "/opt/dr/cert/etc-letsencrypt:/etc/letsencrypt" \
  -v "/opt/dr/cert/var-lib-letsencrypt:/var/lib/letsencrypt" \
  -p 80:80 \
  certbot/certbot renew
EOM
```
