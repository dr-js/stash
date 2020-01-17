#!/usr/bin/env bash

FILE_PID="/root/data-local/server/dr-node/server.pid"

kill $(cat "${FILE_PID}") &> "/dev/null" || true # TODO: not 100% certain
rm -f "${FILE_PID}" # clear pid file
