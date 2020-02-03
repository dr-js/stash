#!/usr/bin/env bash
set -euo pipefail

# common node.js install
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt install nodejs -y
sudo npm i -g npm # update npm
