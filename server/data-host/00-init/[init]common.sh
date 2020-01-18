#!/usr/bin/env bash
set -euo pipefail

# common node.js install
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm i -g npm # update npm
