#!/usr/bin/env bash
set -euo pipefail

# install, check: https://github.com/shadowsocks/shadowsocks-libev#debian--ubuntu
sudo apt update
# sudo apt install shadowsocks-libev # version too old for Ubuntu1804
mkdir -p ~/SHADOWSOCKS_DEBIAN/ # borrow newer version from debian backport
( cd ~/SHADOWSOCKS_DEBIAN/
  wget http://ftp.debian.org/debian/pool/main/i/init-system-helpers/init-system-helpers_1.56~bpo9+1_all.deb
  wget http://ftp.debian.org/debian/pool/main/m/mbedtls/libmbedcrypto0_2.4.2-1+deb9u3_amd64.deb
  wget http://ftp.debian.org/debian/pool/main/s/shadowsocks-libev/shadowsocks-libev_3.3.4+ds-3~bpo9+1_amd64.deb
  echo "69d8f3bca9c78db834faf7022e3871b2e45dfc61d69854813325e3225afc6a20  init-system-helpers_1.56~bpo9+1_all.deb" > ./SHADOWSOCKS_DEB_SHA256SUM
  echo "87a4196bed3d184b6713b9bdcceb8540478c595490398e23ba7d90a4eacf4334  libmbedcrypto0_2.4.2-1+deb9u3_amd64.deb" >> ./SHADOWSOCKS_DEB_SHA256SUM
  echo "7d4d0cedea2b584c3cbff085005ada56d721f78dfc1f350f7429ac7e58b2b489  shadowsocks-libev_3.3.4+ds-3~bpo9+1_amd64.deb" >> ./SHADOWSOCKS_DEB_SHA256SUM
  sha256sum -c ./SHADOWSOCKS_DEB_SHA256SUM
  sudo dpkg -i init-system-helpers_1.56~bpo9+1_all.deb
  sudo dpkg -i libmbedcrypto0_2.4.2-1+deb9u3_amd64.deb
  sudo dpkg -i shadowsocks-libev_3.3.4+ds-3~bpo9+1_amd64.deb || sudo apt install -f -y # fix missing dependencies
)
rm -rf ~/SHADOWSOCKS_DEBIAN/

# update config
node -p "JSON.stringify(require('/mnt/data-link/host-config.json')['51-shadowsocks-config'], null, 2)" | sudo tee "/etc/shadowsocks-libev/config.json"

# add acl from: https://github.com/shadowsocks/shadowsocks-libev/blob/d2581324141f831b65278e22e7ef9e16112cdb78/acl/server_block_local.acl
cat > /etc/shadowsocks-libev/server_block_local.acl <<- 'EOM'
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

# systemd
sudo systemctl restart shadowsocks-libev.service # apply config
sudo systemctl status shadowsocks-libev.service # check status
sudo systemctl enable shadowsocks-libev.service # enable server
