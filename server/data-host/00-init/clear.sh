#!/usr/bin/env bash
set -euo pipefail

cat <<- 'EOM'
MANUAL DATA CLEAR WITH:
  # clinet server
  sudo umount "/mnt/data-link"
  sudo rmdir "/mnt/data-link"
  sudo rm -rf "/root/data-local/"

  # host server
  sudo rm "/mnt/data-link"
  sudo rm -rf "/root/data-local/"
  sudo rm -rf "/root/data-host/"
EOM
