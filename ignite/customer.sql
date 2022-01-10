CREATE TABLE IF NOT EXISTS CUSTOMER (
    "clientId" VARCHAR PRIMARY KEY,
    "name" VARCHAR,
    "category" VARCHAR
) WITH "CACHE_NAME=customer,KEY_TYPE=customer_key,VALUE_TYPE=customer_value";

MERGE INTO CUSTOMER ("clientId", "name", "category") VALUES ('client1', 'John Doe', 'STANDARD');
MERGE INTO CUSTOMER ("clientId", "name", "category") VALUES ('client2', 'Robert Wright', 'GOLD');
MERGE INTO CUSTOMER ("clientId", "name", "category") VALUES ('client3', 'Юрий Шевчук', 'PLATINUM');
MERGE INTO CUSTOMER ("clientId", "name", "category") VALUES ('client4', 'Иосиф Кобзон', 'STANDARD');
