#!/bin/bash

set -a
. ./.env
set +a


mkdir -p "${APPS_WORKSPACE}/gateway/nginx"
cp -a ./nginx/. "${APPS_WORKSPACE}/gateway/nginx/"
echo "Starting core components ..."

docker compose -p gateway up -d gateway

echo "Start up complete."


