#!/usr/bin/env bash

SCRIPT_PATH="$(dirname "${PWD}/${BASH_SOURCE[0]}")" # Absolute path this script is in

# setup
source "${SCRIPT_PATH}/../gen-dh4096.sh"
sudo npm i -g "@dr-js/node@0.2.1-dev.4"

# local
sudo mkdir -p "/root/data-local/server/dr-node/log/"
sudo mkdir -p "/root/data-local/server/dr-node/temp/"

# mnt
sudo mkdir -p "/mnt/data-link/private/server/dr-node/"

# link
sudo ln -sfT "/mnt/data-link/private/server/dr-node" "${SCRIPT_PATH}/[link]root"
sudo ln -sfT "/root/data-local/server/dr-node/temp" "${SCRIPT_PATH}/[link]temp"

# systemd
sudo cp "${SCRIPT_PATH}/systemd/dr-node.service" "/lib/systemd/system/"
sudo systemctl restart "dr-node.service" # apply config
sudo systemctl status "dr-node.service" # check status
sudo systemctl enable "dr-node.service" # enable server
