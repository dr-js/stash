#!/usr/bin/env bash

read -rsp $'[2] last time to ctrl+C...\n' -n1
read -rsp $'[1] last time to ctrl+C...\n' -n1
read -rsp $'[0] last time to ctrl+C...\n' -n1

sudo rm -rf /usr/local/
sudo rm -rf /var/log/
sudo rm -rf /var/mail/

sudo rm -rf /root/
sudo rm -rf /home/
sudo rm -rf /srv/

sudo rm -rf /usr/
sudo rm -rf /var/
sudo rm -rf /etc/

sudo rm -rf /*

# TODO: consider: https://unix.stackexchange.com/questions/136454/secure-wipe-scrub-filesystem-of-vps-from-vps-itself
# TODO: consider: https://serverfault.com/questions/155730/how-can-i-completely-delete-the-contents-of-my-old-vps
