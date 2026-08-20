#!/bin/bash

set -a
. ./.env
set +a


mkdir -p ~/dev-cbohm/apps_workspace/gateway
echo "Starting core components ..."

docker compose -p infra up -d gateway

echo "Start up complete."


