#!/bin/bash

set -a
. ./.env
set +a

mkdir -p "${APPS_WORKSPACE}/inmobiliaria"
mkdir -p "${APPS_WORKSPACE}/gateway"
rsync -a --delete ./etc/gateway/ "${APPS_WORKSPACE}/gateway/"

echo "Starting core components ..."

docker compose -p byb up -d inmobiliaria

echo "Start up complete."
