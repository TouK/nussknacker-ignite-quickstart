CREATE TABLE IF NOT EXISTS AGGREGATES (
    "clientId" VARCHAR,
    "eventDate" TIMESTAMP,
    "amount" BIGINT,
    PRIMARY KEY ("clientId", "eventDate")
) WITH "CACHE_NAME=aggregates,AFFINITY_KEY=eventDate,KEY_TYPE=aggregates_key,VALUE_TYPE=aggregates_value";
