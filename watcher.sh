#!/usr/bin/env bash
set -euo pipefail

wait=${1:-30}

_log() {
  echo "$(date) $@" | tee -a /root/raptoreumd-wrapper.log
}

_info() {
  echo "$(date) $@"
}


while true; do
  errors=0
  _info "waiting ${wait}s before testing"
  sleep ${wait}

  while true; do
    if timeout 15 ./raptoreum-cli getblockcount; then
      errors=0
      _info "raptoreumd ok!"
    else
      let "errors=errors+1"
      _log "raptoreumd errors ${errors}"
      if [ "$errors" = "5" ]; then
        break
      fi
    fi

    sleep 5
  done

  _log "raptoreumd stopped responding, kill"
  set +e
    killall -9 raptoreumd
  set -e
done