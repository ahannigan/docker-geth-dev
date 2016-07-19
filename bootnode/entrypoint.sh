#!/usr/bin/env bash
set -eo pipefail

IP=$(hostname -I)

echo "Running: bootnode --nodekey boot.key --nat extip:${IP}"
bootnode --nodekey boot.key --nat extip:${IP}
