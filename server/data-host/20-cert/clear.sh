#!/usr/bin/env bash
set -euo pipefail

# remove
sudo apt autoremove --purge certbot -y

# config
rm -rf "/etc/letsencrypt"

# output
echo "MANUAL CLEAR DATA: rm -rf /mnt/data-link/private/cert/letsencrypt/"
