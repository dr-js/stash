#!/usr/bin/env bash

dr-js -c "/mnt/data-link/server/dr-js/[dr-js]config.js" \
>> "/root/data-local/server/dr-js/log/$(node -p "new Date().toISOString().replace(/\\W/g, '-')").log"
