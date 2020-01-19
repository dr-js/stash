#!/usr/bin/env bash
set -euo pipefail

SCRIPT_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")" # Absolute directory path this script is in

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
sudo rm -rf "/etc/letsencrypt"
sudo mkdir "/etc/letsencrypt"
sudo tee "/etc/letsencrypt/cli.ini" <<- EOM
# Because we are using logrotate for greater flexibility, disable the internal certbot logrotation.
max-log-backups = 0

# [EXTEND CONFIG] check: https://certbot.eff.org/docs/using.html#configuration-file
# All flags used by the client can be configured here. Run Certbot with "--help" to learn more about the available options.
# Note that these options apply automatically to all use of Certbot for obtaining or renewing certificates,
# so options specific to a single certificate on a system with several certificates should not be placed here.

config-dir = /mnt/data-link/private/cert/letsencrypt/

# Use a 4096 bit RSA key instead of 2048
rsa-key-size = 4096

# Register with the specified e-mail address
# register-unsafely-without-email = True
email = $(node -p "require('/mnt/data-link/host-config.json')['20-cert-letsencrypt-email']")
eff-email = False

# Use the standalone authenticator (on port 80)
authenticator = standalone
EOM

# output
sudo mkdir -p "/mnt/data-link/private/cert/letsencrypt/"

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
