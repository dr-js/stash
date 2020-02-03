# `shadowsocks`


#### `shadowsocks` install

install `shadowsocks-libev`:
- https://github.com/shadowsocks/shadowsocks-libev#debian--ubuntu
    for Debian 8 or higher / Ubuntu 16.10 or higher:
    ```shell script
    sudo apt update
    sudo apt install shadowsocks-libev -y
    ```


#### `shadowsocks` server

config `sudo nano /etc/shadowsocks-libev/config.json` add:
```json
{
  "server":"0.0.0.0",
  "server_port": 12345,
  "password": "123456",
  "timeout": 1000,
  "method": "bf-cfb",
  "fast_open": true
}
```

enable server service: 
```shell script
sudo systemctl enable shadowsocks-libev.service # enable server
sudo systemctl restart shadowsocks-libev.service # apply config
sudo systemctl status shadowsocks-libev.service # check status
```


#### `shadowsocks` local

get `privoxy` for convert http/https to sock5

```shell script
sudo apt install privoxy -y
```

edit `sudo nano /etc/privoxy/config` to convert `shadowsocks`, add:
```shell script
# listen-address 127.0.0.1:8118 # should already have this line
forward-socks5 / 127.0.0.1:1080 .
```

apply config:
```shell script
sudo systemctl enable privoxy.service # enable server
sudo systemctl restart privoxy.service # apply config
sudo systemctl status privoxy.service # check status
```

to use:
```shell script
export http_proxy=http://127.0.0.1:8118
export https_proxy=http://127.0.0.1:8118
```
