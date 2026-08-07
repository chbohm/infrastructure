#!/bin/bash

set -a
. ./.env
set +a

mkdir -p ${APPS_WORKSPACE}/inmobiliaria

echo "Starting core components ..."

docker compose -p byb up -d inmobiliaria

echo "Start up complete."
