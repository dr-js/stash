#!/usr/bin/env bash
set -euo pipefail

SCRIPT_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")" # Absolute directory path this script is in

# mnt
sudo mkdir -p "/mnt/data-link/private/server/"

# dh4096.pem
FILE_DH4096="/mnt/data-link/private/server/dh4096.pem"
if [[ -f "${FILE_DH4096}" ]]; then echo "[server-https|dh4096] skip exist: ${FILE_DH4096}"
else echo "[server-https|dh4096] generate: ${FILE_DH4096} (slow)"
  openssl dhparam \
    -out "${FILE_DH4096}" \
    -outform PEM \
    -dsaparam \
    4096
fi

# DATA_HOST.key
FILE_AUTH_KEY="/mnt/data-link/private/server/DATA_HOST.key"
if [[ -f "${FILE_AUTH_KEY}" ]]; then echo "[server-https|auth-key] skip exist: ${FILE_AUTH_KEY}"
else echo "[server-https|auth-key] generate: ${FILE_AUTH_KEY}"
  dr-node -O "${FILE_AUTH_KEY}" \
    --auth-gen-tag "DATA_HOST" \
    --auth-gen-size 524288 \
    --auth-gen-token-size 12 \
    --auth-gen-time-gap 60 \
    --auth-gen-info "data-host-key#$(node -p "new Date().toISOString()")"
fi
