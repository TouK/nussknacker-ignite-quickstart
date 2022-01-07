#!/bin/bash

set -e

cd "$(dirname $0)"

CONTAINER_NAME=$(docker ps | grep nussknacker_ignite | awk '{print $1}')

docker exec -t $CONTAINER_NAME bash -c "/user_config/execute-sql.sh /user_config/query-aggregates.sql"
