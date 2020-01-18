#!/usr/bin/env bash
set -euo pipefail

# data-link
sudo rm -rf "/mnt/data-link"

# data-local
sudo rm -rf "/root/data-local/"

# data-host
echo "
MANUAL DATA CLEAR COMMAND:
  sudo rm -rf /root/data-host/
"

