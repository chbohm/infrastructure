#!/bin/bash

set -a
. ./.env
set +a

mkdir -p "${APPS_WORKSPACE}/inmobiliaria"
mkdir -p ~/dev-cbohm/registry-data
echo "Starting core components ..."

docker compose -p byb up -d inmobiliaria

echo "Start up complete."
