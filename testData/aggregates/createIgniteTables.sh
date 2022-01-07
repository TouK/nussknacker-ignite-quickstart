#!/bin/bash

set -e

cd "$(dirname $0)"

CONTAINER_NAME=$(docker ps | grep nussknacker_ignite | awk '{print $1}')

echo "Activating Ignite cluster ..."
docker exec -i $CONTAINER_NAME bash -c "/opt/ignite/apache-ignite/bin/control.sh --host localhost --set-state ACTIVE --yes"

echo "Creating customer table"
docker exec -i $CONTAINER_NAME bash -c "/user_config/execute-sql.sh /user_config/customer.sql"

echo "Creating aggregates table"
docker exec -i $CONTAINER_NAME bash -c "/user_config/execute-sql.sh /user_config/aggregates.sql"
