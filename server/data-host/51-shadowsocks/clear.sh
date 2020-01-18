#!/usr/bin/env bash
set -euo pipefail

# remove
sudo apt autoremove --purge shadowsocks-libev -y

# config
rm -rf "/etc/shadowsocks-libev/config.json"
