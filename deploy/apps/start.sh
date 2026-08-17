#!/bin/bash

set -a
. ./.env
set +a

mkdir -p "${APPS_WORKSPACE}/inmobiliaria"
mkdir -p "${APPS_WORKSPACE}/avisos-catolicos"
echo "Starting core components ..."

docker compose -p byb up -d inmobiliaria
docker compose -p byb up -d avisos-catolicos

echo "Start up complete."
