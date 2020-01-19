#!/usr/bin/env bash
set -euo pipefail

# install
# https://github.com/shadowsocks/shadowsocks-libev#debian--ubuntu
sudo apt update
sudo apt install shadowsocks-libev

# config
node -p "JSON.stringify(require('/mnt/data-link/host-config.json')['51-shadowsocks-config'], null, 2)" | sudo tee "/etc/shadowsocks-libev/config.json"

# systemd
sudo systemctl restart shadowsocks-libev.service # apply config
sudo systemctl status shadowsocks-libev.service # check status
sudo systemctl enable shadowsocks-libev.service # enable server
