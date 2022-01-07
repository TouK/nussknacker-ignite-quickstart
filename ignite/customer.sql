CREATE TABLE IF NOT EXISTS CUSTOMER (
    "clientId" VARCHAR PRIMARY KEY,
    "name" VARCHAR,
    "segment" VARCHAR
) WITH "CACHE_NAME=customer,KEY_TYPE=customer_key,VALUE_TYPE=customer_value";

MERGE INTO CUSTOMER ("clientId", "name", "segment") VALUES (1, 'John Doe', 'STANDARD');
MERGE INTO CUSTOMER ("clientId", "name", "segment") VALUES (2, 'Robert Wright', 'GOLD');
MERGE INTO CUSTOMER ("clientId", "name", "segment") VALUES (3, 'Юрий Шевчук', 'PLATINUM');
MERGE INTO CUSTOMER ("clientId", "name", "segment") VALUES (4, 'Иосиф Кобзон', 'STANDARD');
