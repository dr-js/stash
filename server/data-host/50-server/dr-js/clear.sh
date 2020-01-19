#!/usr/bin/env bash
set -euo pipefail

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
# # remove
# sudo npm rm -g "@dr-js/js"
