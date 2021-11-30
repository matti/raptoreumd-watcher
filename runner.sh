#!/usr/bin/env bash
set -euo pipefail

while true; do
  [ -f /tmp/raptoreumd.shutdown ] && break
  set +e
    ./raptoreumd -printtoconsole
  set -e
  sleep 1
done
rm -f /tmp/raptoreumd.shutdown

echo "/tmp/raptoreumd.shutdown exists, exiting"
