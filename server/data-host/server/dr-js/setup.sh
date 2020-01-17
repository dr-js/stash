#!/usr/bin/env bash

SCRIPT_PATH="$(dirname "${PWD}/${BASH_SOURCE[0]}")" # Absolute path this script is in

# setup
sudo npm i -g "@dr-js/core@0.2.1-dev.3"

# local
sudo mkdir -p "/root/data-local/server/dr-js/log/"

# mnt
sudo mkdir -p "/mnt/data-link/share/server/dr-js/"

# link
sudo ln -sfT "/mnt/data-link/share/server/dr-js" "${SCRIPT_PATH}/[link]root"

# systemd
sudo cp "${SCRIPT_PATH}/systemd/dr-js.service" "/lib/systemd/system/"
sudo systemctl restart "dr-js.service" # apply config
sudo systemctl status "dr-js.service" # check status
sudo systemctl enable "dr-js.service" # enable server
