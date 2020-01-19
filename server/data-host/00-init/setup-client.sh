#!/usr/bin/env bash
set -euo pipefail

SCRIPT_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")" # Absolute directory path this script is in

# common setup
(source "${SCRIPT_PATH}/[init]common.sh")

# data-local
sudo mkdir -p "/root/data-local/"
( cd "/root/data-local/" &&
  mkdir -p "./private/public/share" &&
  ln -sfT "./private/public" "public" &&
  ln -sfT "./private/public/share" "share"
)

# data-link
sudo mkdir -p "/mnt/data-link/" # should later config remote-mount

# ssh basic setup
sudo mkdir -p "/root/.ssh/"
sudo touch "/root/.ssh/config"
sudo chmod 600 "/root/.ssh/config"

# generate new ssh key
HOST_HOSTNAME="$(cd "${SCRIPT_PATH}" && node -p "require('./client-config.json')['client-data-hostname']")"
NAME_DATA_LINK="data-link-$(node -p "new Date().toISOString().replace(/\\W/g, '-')")"
sudo ssh-keygen -t rsa -b 4096 -N "" \
  -f "/root/.ssh/${NAME_DATA_LINK}.pri" \
  -C "${NAME_DATA_LINK}#${HOSTNAME}"
sudo mv "/root/.ssh/${NAME_DATA_LINK}.pri.pub" "/root/.ssh/${NAME_DATA_LINK}.pub" # fix naming
sudo tee -a "/root/.ssh/config" <<- EOM
# data-host
Host data-host
  HostName ${HOST_HOSTNAME}
  Port 22
  User root
  IdentityFile "/root/.ssh/${NAME_DATA_LINK}.pri"
EOM
echo "==== should add to ${HOST_HOSTNAME} server authorized_keys ===="
echo "# ${NAME_DATA_LINK}#${HOSTNAME}"
sudo cat "/root/.ssh/${NAME_DATA_LINK}.pub"
echo "==== should add to ${HOST_HOSTNAME} server authorized_keys ===="
read -rsp $'[2] setup host SSH before continue...\n' -n1 # wait for manual setup
read -rsp $'[1] setup host SSH before continue...\n' -n1 # wait for manual setup
read -rsp $'[0] setup host SSH before continue...\n' -n1 # wait for manual setup

# sshfs
sudo apt-get install sshfs -y
sudo tee -a /etc/fstab <<- 'EOM'
# /mnt/data-link/
sshfs#root@data-host:/root/data-link/ /mnt/data-link/ fuse _netdev,user,auto_cache,reconnect,allow_other 0 0
EOM
sudo systemctl daemon-reload
sudo mount -a
