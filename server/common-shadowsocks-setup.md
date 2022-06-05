# common shadowsocks setup

```shell
# setup
sudo mkdir -p /opt/dr/
sudo chmod 777 /opt/dr/
mkdir -p /opt/dr/shadowsocks-rust/

# get & unpack: https://github.com/shadowsocks/shadowsocks-rust/releases
DR -f https://github.com/shadowsocks/shadowsocks-rust/releases/download/v1.14.3/shadowsocks-v1.14.3.x86_64-unknown-linux-gnu.tar.xz \
   -O /opt/dr/shadowsocks-rust/shadowsocks.tar.xz
# should have file: `/opt/dr/shadowsocks-rust/ssserver`
DR -xI /opt/dr/shadowsocks-rust/shadowsocks.tar.xz -O /opt/dr/shadowsocks-rust/

tee /opt/dr/shadowsocks-rust/config.json <<- 'EOM'
{
  "server": "0.0.0.0", "server_port": 123456789,
  "password": "password-passwordpassword", "method": "chacha20-ietf-poly1305",
  "mode": "tcp_and_udp",
  "timeout": 1000,
  "fast_open": true,
  "acl": "/opt/dr/shadowsocks-rust/server_block_local.acl"
}
EOM

tee /opt/dr/shadowsocks-rust/server_block_local.acl <<- 'EOM'
# All IPs listed here will be blocked while the ss-server try to outbound.
# Only IP is allowed, *NOT* domain name.
#

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
EOM

tee /opt/dr/shadowsocks-rust/dr-ssserver-22.service <<- 'EOM'
[Unit]
Description=ServerShadowSocks@port22
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=5
User=root
ExecStart=/opt/dr/shadowsocks-rust/ssserver -c /opt/dr/shadowsocks-rust/config.json

[Install]
WantedBy=multi-user.target
EOM

# enable
sudo ln -sfT /opt/dr/shadowsocks-rust/dr-ssserver-22.service /lib/systemd/system/dr-ssserver-22.service
sudo systemctl start dr-ssserver-22.service
sudo systemctl enable dr-ssserver-22.service
sudo systemctl status dr-ssserver-22.service

# remove
sudo systemctl stop dr-ssserver-22.service
sudo systemctl disable dr-ssserver-22.service
sudo rm /lib/systemd/system/dr-ssserver-22.service
```
