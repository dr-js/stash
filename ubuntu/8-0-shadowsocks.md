# `shadowsocks`


#### `shadowsocks` install

install `shadowsocks-libev`:
- https://github.com/shadowsocks/shadowsocks-libev#debian--ubuntu
    for Debian 8 or higher / Ubuntu 16.10 or higher:
    ```shell script
    sudo apt update
    sudo apt install shadowsocks-libev -y
    ```

check manual for config: `man shadowsocks-libev`

#### `shadowsocks` server

config `sudo nano /etc/shadowsocks-libev/config.json` add:
```json
{
  "server":"0.0.0.0",
  "server_port": 12345,
  "password": "123456",
  "timeout": 1000,
  "method": "bf-cfb",
  "fast_open": true,
  "mode": "tcp_and_udp"
}
```

enable server service: (should auto started after install)
```shell script
sudo systemctl enable shadowsocks-libev.service # enable server
sudo systemctl restart shadowsocks-libev.service # apply config
sudo systemctl status shadowsocks-libev.service # check status
```

#### `shadowsocks` local

config `sudo nano /etc/shadowsocks-libev/local-config.json` add:
```json
{
  "local_address": "127.0.0.1",
  "local_port": 1080,
  "server":"999.999.999.999",
  "server_port": 12345,
  "password": "123456",
  "timeout": 1000,
  "method": "bf-cfb",
  "fast_open": true,
  "mode": "tcp_and_udp"
}
```

enable server service: 
```shell script
sudo systemctl enable shadowsocks-libev-local@local-config.service # enable server
sudo systemctl restart shadowsocks-libev-local@local-config.service # apply config
sudo systemctl status shadowsocks-libev-local@local-config.service # check status
```

get `privoxy` for convert http/https to socks5

```shell script
sudo apt install privoxy -y
```

edit `sudo nano /etc/privoxy/config` to convert `shadowsocks`, add:
```shell script
# listen-address 127.0.0.1:8118 # should already have this line, change to 0.0.0.0:8118 to allow LAN proxy connection
forward-socks5 / 127.0.0.1:1080 . # forward and change protocol to socks5 for shadowsocks
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
