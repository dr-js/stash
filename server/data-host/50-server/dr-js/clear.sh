#!/usr/bin/env bash
set -euo pipefail

# SCRIPT_PATH="$(dirname "${PWD}/${BASH_SOURCE[0]}")" # Absolute path this script is in

# systemd
sudo systemctl stop "dr-js.service" # stop server
sudo systemctl disable "dr-js.service" # disable server
sudo rm "/lib/systemd/system/dr-js.service"

# # local
# sudo rm -rf "/root/data-local/server/dr-js/"
#
# # mnt
# sudo rm -rf "/mnt/data-link/share/server/dr-js/"
#
# # link
# sudo rm "${SCRIPT_PATH}/[link]root"
#
# # remove
# sudo npm rm -g "@dr-js/js"
