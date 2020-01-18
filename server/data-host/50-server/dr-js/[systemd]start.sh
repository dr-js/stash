#!/usr/bin/env bash
set -euo pipefail

SCRIPT_PATH="$(dirname "${PWD}/${BASH_SOURCE[0]}")" # Absolute path this script is in

source "${SCRIPT_PATH}/../[systemd]test-data-link.sh"

dr-js -c "${SCRIPT_PATH}/[dr-js]config.js" \
>> "/root/data-local/server/dr-js/log/$(node -p "new Date().toISOString().replace(/\\W/g, '-')").log"
