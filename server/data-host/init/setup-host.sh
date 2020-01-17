#!/usr/bin/env bash

SCRIPT_PATH="$(dirname "${PWD}/${BASH_SOURCE[0]}")" # Absolute path this script is in

source "${SCRIPT_PATH}/[init]common.sh"

# data-host
sudo mkdir -p "/root/data-host/"
( cd "/root/data-host/" &&
  mkdir -p "./private/public/share" &&
  ln -sfT "./private/public" "public" &&
  ln -sfT "./private/public/share" "share"
)

# data-local
sudo mkdir -p "/root/data-local/"
( cd "/root/data-local/" &&
  mkdir -p "./private/public/share" &&
  ln -sfT "./private/public" "public" &&
  ln -sfT "./private/public/share" "share"
)

# data-link
ln -sfT "./root/data-host" "/mnt/data-link" # symlink in place of remote-mount
