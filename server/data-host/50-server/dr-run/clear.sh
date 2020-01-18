#!/usr/bin/env bash
set -euo pipefail

# SCRIPT_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")" # Absolute directory path this script is in

# systemd
sudo systemctl stop "dr-run.service" # stop server
sudo systemctl disable "dr-run.service" # disable server
sudo rm "/lib/systemd/system/dr-run.service"

# # local
# sudo rm -rf "/root/data-local/server/dr-run/"
#
# # mnt
# sudo rm -rf "/mnt/data-link/private/server/dr-run/"
# sudo rm -rf "/mnt/data-link/public/server/dr-run/"
#
# # link
# sudo rm "${SCRIPT_PATH}/[link]root"
# sudo rm "${SCRIPT_PATH}/[link]temp"
#
# # remove
# sudo npm rm -g "@dr-js/run"
