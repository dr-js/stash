#!/usr/bin/env bash

# remove ======================
sudo apt autoremove --purge certbot -y

# reset config ================
rm -rf "/etc/letsencrypt"

# output ======================
echo "MANUAL CLEAR DATA: rm -rf /mnt/data-link/private/cert/letsencrypt/"
