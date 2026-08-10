#!/bin/bash

set -a
. ./.env
set +a


mkdir -p ~/dev-cbohm/registry-data
echo "Starting core components ..."

docker compose -p infra up -d registry

echo "Start up complete."
