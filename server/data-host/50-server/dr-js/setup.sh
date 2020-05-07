#!/usr/bin/env bash
set -euo pipefail

SCRIPT_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")" # Absolute directory path this script is in

# setup
sudo npm i -g "@dr-js/core@0.3.0-dev.12"

# local
sudo mkdir -p "/root/data-local/server/dr-js/log/"

# mnt
sudo mkdir -p "/mnt/data-link/share/server/dr-js/"

# systemd
sudo tee "/lib/systemd/system/dr-js.service" <<- EOM
[Unit]
Description=Server dr-js
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
sudo systemctl restart "dr-js.service" # apply config
sudo systemctl status "dr-js.service" # check status
sudo systemctl enable "dr-js.service" # enable server
