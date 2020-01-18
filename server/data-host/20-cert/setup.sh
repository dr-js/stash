#!/usr/bin/env bash
set -euo pipefail

SCRIPT_PATH="$(dirname "${PWD}/${BASH_SOURCE[0]}")" # Absolute path this script is in

# install
# check: https://certbot.eff.org/lets-encrypt/ubuntubionic-other
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt-get update
# stop the auto renew timer, or the triggered multi-write may break shared folder
sudo apt-get install certbot -y \
  -o Dpkg::Options::="--path-exclude=/etc/cron*/*" \
  -o Dpkg::Options::="--path-exclude=/lib/systemd/system/*"

# setup config
rm -rf "/etc/letsencrypt"
mkdir "/etc/letsencrypt"
cp "${SCRIPT_PATH}/letsencrypt/cli.ini" "/etc/letsencrypt/cli.ini"

# output
mkdir -p "/mnt/data-link/private/cert/letsencrypt/"

echo "
# to request a new cert for a domain:
sudo certbot certonly --standalone                # fill out questions

# to check existing cert:
sudo certbot certificates                         # check cert & expire time
sudo certbot renew --dry-run                      # or use this for cert check

# to request cert renew: (auto renew is disabled above)
sudo certbot renew                                # renew all cert
sudo certbot renew --cert-name DOMAIN.NAME.HERE   # renew single cert
"
