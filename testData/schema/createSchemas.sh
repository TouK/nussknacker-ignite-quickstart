#!/bin/bash

set -e

cd "$(dirname $0)"

for file in *.avsc; do
  filename=$(basename "$file" .avsc)
  jq '{ schema: tostring }' "$file" | curl -X POST -H "Content-Type: application/vnd.schemaregistry.v1+json" --data @- "http://localhost:3082/subjects/$filename/versions"
  echo
done
