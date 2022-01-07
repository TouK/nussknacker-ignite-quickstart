#!/bin/bash

set -e

cd "$(dirname $0)"

TOPIC=$1
URL_PATH="akhq/api/nussknacker/group/$2"
SLEEP=${3-2}
WAIT_LIMIT=${4-8}


checkConsumerTopics() {
  curl -s "http://admin:admin@localhost:8081/$URL_PATH" 2>/dev/null | jq -r ".topics[0]"
}

waitTime=0
echo "Checking if consumer group $2 started on topic $1"

CONSUMER_GROUP_TOPIC=$(checkConsumerTopics)

while [[ $waitTime -lt $WAIT_LIMIT && $CONSUMER_GROUP_TOPIC != $TOPIC ]]; do
  sleep $SLEEP
  waitTime=$((waitTime + $SLEEP))
  CONSUMER_GROUP_TOPIC=$(checkConsumerTopics)

  if [[ $CONSUMER_GROUP_TOPIC != $TOPIC ]]; then
    echo "Consumer group still not started within $waitTime sec... Found topic [$CONSUMER_GROUP_TOPIC]"
  fi
done

