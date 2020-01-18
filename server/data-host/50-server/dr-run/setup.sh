#!/usr/bin/env bash
set -euo pipefail

SCRIPT_PATH="$(dirname "${PWD}/${BASH_SOURCE[0]}")" # Absolute path this script is in

# setup
source "${SCRIPT_PATH}/../gen-dh4096.sh"
sudo npm i -g "@dr-js/run@0.1.3-dev.1"

# local
sudo mkdir -p "/root/data-local/server/dr-run/log/"
sudo mkdir -p "/root/data-local/server/dr-run/temp/"

# mnt
sudo mkdir -p "/mnt/data-link/private/server/dr-run/file/"
sudo mkdir -p "/mnt/data-link/public/server/dr-run/"
sudo ln -sfT "/mnt/data-link/public/server/dr-run" "/mnt/data-link/private/server/dr-run/file/[PUBLIC]"

# link
sudo ln -sfT "/mnt/data-link/private/server/dr-run" "${SCRIPT_PATH}/[link]root"
sudo ln -sfT "/root/data-local/server/dr-run/temp" "${SCRIPT_PATH}/[link]temp"

# systemd
sudo tee "/lib/systemd/system/dr-run.service" <<- EOM
[Unit]
Description=Server dr-run
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
sudo systemctl restart "dr-run.service" # apply config
sudo systemctl status "dr-run.service" # check status
sudo systemctl enable "dr-run.service" # enable server
