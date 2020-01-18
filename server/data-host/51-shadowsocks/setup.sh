#!/usr/bin/env bash
set -euo pipefail

# install
# https://github.com/shadowsocks/shadowsocks-libev#debian--ubuntu
sudo apt update
sudo apt install shadowsocks-libev

# config
sudo tee "/etc/shadowsocks-libev/config.json" <<- EOM
{
  "server":"0.0.0.0",
  "server_port": 12345,
  "password": "TODO: CONFIG HERE",
  "timeout": 1000,
  "method": "bf-cfb",
  "fast_open": true
}
EOM

# systemd
sudo systemctl restart shadowsocks-libev.service # apply config
sudo systemctl status shadowsocks-libev.service # check status
sudo systemctl enable shadowsocks-libev.service # enable server
