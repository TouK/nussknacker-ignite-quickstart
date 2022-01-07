#!/usr/bin/env bash

set -e

cd "$(dirname $0)"

./docker-compose.sh pull
./docker-compose.sh up -d
