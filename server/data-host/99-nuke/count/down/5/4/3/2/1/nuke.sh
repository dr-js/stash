#!/usr/bin/env bash

read -rsp $'[2] last time to ctrl+C...\n' -n1
read -rsp $'[1] last time to ctrl+C...\n' -n1
read -rsp $'[0] last time to ctrl+C...\n' -n1

sudo bash -c "
rm -rf /usr/local/;
rm -rf /var/log/;
rm -rf /var/mail/;

rm -rf /root/;
rm -rf /home/;
rm -rf /srv/;

rm -rf /usr/;
rm -rf /var/;
rm -rf /etc/;

rm -rf /*;
"


# TODO: consider: https://unix.stackexchange.com/questions/136454/secure-wipe-scrub-filesystem-of-vps-from-vps-itself
# TODO: consider: https://serverfault.com/questions/155730/how-can-i-completely-delete-the-contents-of-my-old-vps
