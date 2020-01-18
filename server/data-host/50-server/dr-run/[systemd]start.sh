#!/usr/bin/env bash
set -euo pipefail

SCRIPT_PATH="$(dirname "${PWD}/${BASH_SOURCE[0]}")" # Absolute path this script is in

source "${SCRIPT_PATH}/../[systemd]test-data-link.sh"

dr-run -c "${SCRIPT_PATH}/[dr-run]config.js"
