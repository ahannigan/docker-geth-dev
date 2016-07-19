#!/usr/bin/env bash
set -eo pipefail

# init genesis json
geth init ${ETH_DIR}/genesis.json

# if command starts with an option, prepend geth
if [ "${1:0:1}" = '-' ]; then
  set -- geth --bootnodes "enode://6bdb5a4b708db0020d12030fee1758fb9a737587138d7f8e4a0de066bd3278e9bc7e9bfbd3ba93ff586522eac6fa46044b1e33b9876d646315d4ef97d5c05ca9@172.21.0.2:30301" "$@"
fi

if [ "$MINE_WHEN_NEEDED" == "true" ]; then
  set -- "$@" js /mine_when_needed.js
fi

echo "Running: $@"
exec "$@"
