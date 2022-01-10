#!/usr/bin/env bash

set -e

cd "$(dirname $0)"

echo "Starting docker containers.."
./start.sh

./testData/waitForOkFromUrl.sh "api/processes" "Checking Nussknacker API response.." "Nussknacker not started" "designer"

./testData/waitForOkFromUrl.sh "flink/" "Checking Flink response.." "Flink not started" "jobmanager"

./testData/waitForOkFromUrl.sh "metrics" "Checking Grafana response.." "Grafana not started" "grafana"

./testData/importAndDeploy.sh ./DetectLargeTransactionsWithAggregationAndEnricher.json

./testData/waitForOkFromUrl.sh "api/processes/status" "Checking connect with Flink.." "Nussknacker not connected with flink" "designer"

./testData/aggregates/createIgniteTables.sh

./testData/waitForKafkaConsumer.sh "transactions" "DetectLargeTransactions-bank-transactions"

./testData/sendTestTransactions.sh
