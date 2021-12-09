#!/usr/bin/env bash

set -euo pipefail

cd "${RAPTOREUM_PATH:-/root}" || exit 1

./runner.sh &

echo "Blindly waiting 30 minutes for raptoreumd to become available during a cold boot"
sleep 1800
./watcher.sh
