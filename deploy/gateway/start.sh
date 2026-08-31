#!/bin/bash

set -a
. ./.env
set +a


mkdir -p ${APPS_WORKSPACE}/gateway
cp -R ./nginx ${APPS_WORKSPACE}/gateway
echo "Starting core components ..."

docker compose -p gateway up -d gateway

echo "Start up complete."


