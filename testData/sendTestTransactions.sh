#!/bin/bash

set -e

cd "$(dirname $0)"
COUNT=${1-5}

for i in $(seq 1 $COUNT); do
  AMOUNT=$((1 + `tr -cd 0-9 </dev/urandom | head -c 4 | sed -e 's/^00*//'` % 30))
  NOW=`date +%s%3N`
  echo "{ \"clientId\": \"client$i\", \"amount\": $AMOUNT, \"isLast\": false, \"eventDate\": { \"long\": $NOW } }"
done | ./sendToKafka.sh transactions
