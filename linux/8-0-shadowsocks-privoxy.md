# `shadowsocks` and `privoxy`


## install `shadowsocks`

install `shadowsocks-rust`: (check https://github.com/shadowsocks/shadowsocks-rust/releases)
use: https://www.npmjs.com/package/@min-pack/ss-rust

check manual at: https://github.com/shadowsocks/shadowsocks-rust#getting-started

#### `shadowsocks` server config

config `nano /opt/dr/common/shadowsocks-rust/config.json` and add:
```json
{
  "servers": [ {
    "server": "0.0.0.0", "server_port": 123,   "password": "123456", "method": "chacha20-ietf-poly1305" }, {
    "server": "0.0.0.0", "server_port": 1234,  "password": "123456", "method": "chacha20-ietf-poly1305" }, {
    "server": "0.0.0.0", "server_port": 12345, "password": "123456", "method": "chacha20-ietf-poly1305"
  } ],
  "timeout": 1000,
  "mode": "tcp_only",
  "acl": "/opt/dr/common/shadowsocks-rust/server_block_local.acl"
}
```

also `nano /opt/dr/common/shadowsocks-rust/server_block_local.acl` and add:
```
# All IPs listed here will be blocked while the ss-server try to outbound. Only IP is allowed, *NOT* domain name.
[outbound_block_list]
0.0.0.0/8
10.0.0.0/8
100.64.0.0/10
127.0.0.0/8
169.254.0.0/16
172.16.0.0/12
192.0.0.0/24
192.0.2.0/24
192.88.99.0/24
192.168.0.0/16
198.18.0.0/15
198.51.100.0/24
203.0.113.0/24
224.0.0.0/4
240.0.0.0/4
255.255.255.255/32
::1/128
::ffff:127.0.0.1/104
fc00::/7
fe80::/10
```

start with `sudo ss-rust server -c /opt/dr/common/shadowsocks-rust/config.json`

#### `shadowsocks` local config

config `nano /opt/dr/common/shadowsocks-rust/local-config.json` add:
```json
{
  "locals": [
    { "local_address": "127.0.0.1", "local_port": 1081 },
    { "protocol": "http", "local_address": "127.0.0.1", "local_port": 1080 }
  ],
  "server":"999.999.999.999", "server_port": 12345,
  "password": "123456", "method": "chacha20-ietf-poly1305",
  "mode": "tcp_only", "timeout": 1000
}
```

start with `sudo ss-rust local -c /opt/dr/common/shadowsocks-rust/local-config.json`

this will open both `sock5@1081` and `http@1080`, so no `privoxy` needed

    ## install `privoxy`
    
    ```shell script
    sudo pacman -S privoxy --noconfirm # arch
    sudo apt install privoxy -y # ubuntu
    ```
    
    to convert http to socks5 for local `shadowsocks`,
    edit `sudo nano /etc/privoxy/config` and add:
    ```shell script
    # listen-address 127.0.0.1:8118 # should already have this line
    listen-address  0.0.0.0:1080 # change to port 1080, change to 0.0.0.0:1080 to allow LAN proxy connection
    
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
