#!/usr/bin/env bash
set -euo pipefail

# SCRIPT_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")" # Absolute directory path this script is in

# systemd
sudo systemctl stop "dr-node.service" # stop server
sudo systemctl disable "dr-node.service" # disable server
sudo rm "/lib/systemd/system/dr-node.service"

# # local
# sudo rm -rf "/root/data-local/server/dr-node/"
#
# # mnt
# sudo rm -rf "/mnt/data-link/private/server/dr-node/"
#
# # link
# sudo rm "${SCRIPT_PATH}/[link]root"
# sudo rm "${SCRIPT_PATH}/[link]temp"
#
# # remove
# sudo npm rm -g "@dr-js/node"
