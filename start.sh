#!/bin/sh

cd "${RAPTOREUM_PATH:-/root}" || exit 1

./runner.sh &
./watcher.sh
