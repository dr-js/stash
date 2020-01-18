#!/usr/bin/env bash
set -euo pipefail

[[ -d "/mnt/data-link/private/" ]] && exit 0 # good! mounted

sleep 8 # wait
[[ -d "/mnt/data-link/private/" ]] && exit 0 # good! mounted

sleep 8 # wait, again
[[ -d "/mnt/data-link/private/" ]] && exit 0 # good! mounted

echo "expect '/mnt/data-link/private/' exist"
exit 1 # failed
