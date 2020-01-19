#!/usr/bin/env bash
set -euo pipefail

# systemd
sudo systemctl stop "dr-run.service" # stop server
sudo systemctl disable "dr-run.service" # disable server
sudo rm "/lib/systemd/system/dr-run.service"

# # local
# sudo rm -rf "/root/data-local/server/dr-run/"
#
# # mnt
# sudo rm -rf "/mnt/data-link/private/server/dr-run/"
#
# # remove
# sudo npm rm -g "@dr-js/run"
