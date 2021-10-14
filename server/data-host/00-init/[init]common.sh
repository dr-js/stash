#!/usr/bin/env bash
set -euo pipefail

# common node.js install
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install nodejs -y
sudo npm i -g npm # update npm

# stop npm spawn many un-finishing update checking process
sudo npm config set --global update-notifier false # for `sudo npm i -g`
