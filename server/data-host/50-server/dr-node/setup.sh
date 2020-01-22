#!/usr/bin/env bash
set -euo pipefail

SCRIPT_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")" # Absolute directory path this script is in

# setup
(source "${SCRIPT_PATH}/../[server-https]common.sh")
sudo npm i -g "@dr-js/node@0.3.0-dev.0"

# local
sudo mkdir -p "/root/data-local/server/dr-node/log/"
sudo mkdir -p "/root/data-local/server/dr-node/temp/"

# mnt
sudo mkdir -p "/mnt/data-link/private/server/dr-node/"

# systemd
sudo tee "/lib/systemd/system/dr-node.service" <<- EOM
[Unit]
Description=Server dr-node
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=8

User=root
ExecStart=/bin/bash "${SCRIPT_PATH}/[systemd]start.sh"
ExecStop=/bin/bash "${SCRIPT_PATH}/[systemd]stop.sh"

[Install]
WantedBy=multi-user.target
EOM
sudo systemctl restart "dr-node.service" # apply config
sudo systemctl status "dr-node.service" # check status
sudo systemctl enable "dr-node.service" # enable server
