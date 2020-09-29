# `shadowsocks` and `privoxy`


#### install `shadowsocks`

install `shadowsocks-libev`:
```shell script
( # arch
  sudo pacman -S shadowsocks-libev --noconfirm
  sudo mkdir -p /etc/shadowsocks/
  sudo ln -sfT /etc/shadowsocks /etc/shadowsocks-libev # patch naming
  sudo ln -sfT shadowsocks-libev@.service /lib/systemd/system/shadowsocks-libev-local@.service # patch naming
)

( # ubuntu, old but easy version (for new and hacky version check: server/data-host/51-shadowsocks/setup.sh)
  # for Debian 8 or higher / Ubuntu 16.10 or higher, check: https://github.com/shadowsocks/shadowsocks-libev#debian--ubuntu
  sudo apt update
  sudo apt install shadowsocks-libev -y
)
```

check manual for config file: `man shadowsocks-libev`


#### `shadowsocks` server

config `sudo nano /etc/shadowsocks-libev/config.json` and add:
```json
{
  "server": [ "::", "0.0.0.0" ],
  "server_port": 12345,
  "password": "123456",
  "method": "chacha20-ietf-poly1305",
  "mode": "tcp_and_udp",
  "timeout": 1000,
  "fast_open": true
}
```

enable server service:
```shell script
sudo systemctl enable shadowsocks-libev-server@config.service # enable server
sudo systemctl restart shadowsocks-libev-server@config.service # apply config
sudo systemctl status shadowsocks-libev-server@config.service # check status
```


#### `shadowsocks` local

config `sudo nano /etc/shadowsocks-libev/local-config.json` add:
```json
{
  "local_address": "127.0.0.1",
  "local_port": 1081,
  "server":"999.999.999.999",
  "server_port": 12345,
  "password": "123456",
  "method": "chacha20-ietf-poly1305",
  "mode": "tcp_and_udp",
  "timeout": 1000,
  "fast_open": true
}
```

enable server service: 
```shell script
sudo systemctl enable shadowsocks-libev-local@local-config.service # enable server
sudo systemctl restart shadowsocks-libev-local@local-config.service # apply config
sudo systemctl status shadowsocks-libev-local@local-config.service # check status
```


#### install `privoxy`


```shell script
sudo pacman -S privoxy --noconfirm # arch
sudo apt install privoxy -y # ubuntu
```

to convert http to socks5 for local `shadowsocks`,
edit `sudo nano /etc/privoxy/config` and add:
```shell script
# listen-address 127.0.0.1:8118 # should already have this line
listen-address  127.0.0.1:1080 # change to port 1080, change to 0.0.0.0:1080 to allow LAN proxy connection

# check: https://www.privoxy.org/user-manual/config.html#SOCKS

# convert protocol to socks5 and forward to shadowsocks
forward-socks5  /             127.0.0.1:1081  .

# skip proxy common localhost connection
forward         192.168.*.*/                  .
forward         10.*.*.*/                     .
forward         127.*.*.*/                    .
forward         localhost/                    .
```

apply config:
```shell script
sudo systemctl enable privoxy.service # enable server
sudo systemctl restart privoxy.service # apply config
sudo systemctl status privoxy.service # check status
```

basic usage:
```shell script
export http_proxy=http://127.0.0.1:1080
export https_proxy=http://127.0.0.1:1080
```
