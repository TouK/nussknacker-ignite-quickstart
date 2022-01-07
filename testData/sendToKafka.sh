#!/bin/sh

set -e

cd "$(dirname $0)"

echo "Sending messages to topic $1"

CONTAINER_NAME=$(docker ps | grep nussknacker_schemaregistry | awk '{print $1}')
SCHEMA_ID=$(docker exec $CONTAINER_NAME bash -c "curl http://localhost:8081/subjects/$1-value/versions/latest 2>/dev/null" | jq '.id')

docker exec -i $CONTAINER_NAME kafka-avro-console-producer --topic $1 --bootstrap-server kafka:9092 \
 --property value.schema.id=$SCHEMA_ID --property schema.registry.url=http://localhost:8081
