#!/usr/bin/env bash

[[ -d "/mnt/data-link/" ]] && exit 0 # good! mounted

sleep 8 # wait
[[ -d "/mnt/data-link/" ]] && exit 0 # good! mounted

sleep 8 # wait, again
[[ -d "/mnt/data-link/" ]] && exit 0 # good! mounted

echo "expect '/mnt/data-link/' exist"
exit 1 # failed
