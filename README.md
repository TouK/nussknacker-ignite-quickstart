[![Build status](https://github.com/touk/nussknacker-quickstart/workflows/CI/badge.svg)](https://github.com/touk/nussknacker-quickstart/actions?query=workflow%3A%22CI%22)

# Nussknacker Ignite Quickstart

This is slightly modified version of Nussknacker's [quickstart](https://nussknacker.io/quickstart/docker).

It shows how to use [Apache Ignite](https://ignite.apache.org/) in several cases of Nussknacker deployment:
 * aggregation - persist large aggregates collected while processing input records
 * enrichment - enrich input records with detailed data using Ignite as super-fast cache 

## Running

### Prerequisites
* `docker-compose`
* `jq`

To run end-to-end scenarios, just run:
```bash
./testAggregates.sh
```
for aggregation scenario, or
```bash
./testEnrichment.sh
``` 
for enrichment.

To cleanup Docker stuff after running end-to-end tests run `./cleanup.sh`.

## Detailed setup

You can just run `./start.sh` to pull and start required docker images. 

After doing it, you can access following components:
* [Nussknacker](http://localhost:8081/) - user/password: admin/admin
* [Apache Flink UI](http://localhost:8081/flink/)
* [Apache NiFi](http://localhost:3080/nifi/)
* [Grafana](http://localhost:8081/grafana/)
* [AKHQ](http://localhost:8081/akhq/)

### Ignite
Ignite doesn't expose any UI to access, you can connect to it using JDBC or built-in `sqlline` tool:
```bash
#> docker exec -it nussknacker_ignite bash
bash-4.4# /opt/ignite/apache-ignite/bin/sqlline.sh -u 'jdbc:ignite:thin://ignite' -n ignite -p ignite
sqlline version 1.9.0
0: jdbc:ignite:thin://ignite> select * from customer;
+----------+---------------+----------+
| clientId |     name      | category |
+----------+---------------+----------+
| client1  | John Doe      | STANDARD |
| client2  | Robert Wright | GOLD     |
| client3  | Юрий Шевчук   | PLATINUM |
| client4  | Иосиф Кобзон  | STANDARD |
+----------+---------------+----------+
4 rows selected (0.036 seconds)
0: jdbc:ignite:thin://ignite> 
```

There is also helper script to query aggregates table:
```bash
#> ./testData/aggregates/queryIgniteAggregates.sh
1/1          SELECT * FROM AGGREGATES ORDER BY "eventDate" DESC;
+----------+-----------------------+--------+
| clientId |       eventDate       | amount |
+----------+-----------------------+--------+
| client1  | 2022-01-10 00:00:00.0 | 158    |
| client2  | 2022-01-10 00:00:00.0 | 175    |
| client3  | 2022-01-10 00:00:00.0 | 190    |
| client4  | 2022-01-10 00:00:00.0 | 192    |
| client5  | 2022-01-10 00:00:00.0 | 188    |
+----------+-----------------------+--------+
5 rows selected (0.061 seconds)
sqlline version 1.9.0
```

### NiFi
In aggregates scenario, updated aggregate records are published to `dailyAggregates` topic. In order to populate this data
to Ignite, a simple NiFi flow is provided:

![nifi_aggregates](https://user-images.githubusercontent.com/513361/148759847-16f3f62e-1b06-46f3-9536-7b72b8f38aa2.png)

This `PutIgniteRecord` processor is a part of our [nifi-extensions](https://github.com/TouK/nifi-extensions) project.

### Scripts
Here's a brief summary of scripts located in `testData` directory, which are used in end-to-end scenarios:
* `createIgniteTables.sh` - creates Ignite tables and populates with basic data
* `importAndDeploy.sh <scenario_file>` - imports Nussknacker's scenario from `scenario_file` and deploys it to Flink
* `sendTestTransactions.sh <count>` - sends random `count` transactions to input topic 

## What's next?

More advanced usages of Nussknacker image (available properties and so on) you can find out on our [Installation guide](https://docs.nussknacker.io/docs/next/installation_configuration_guide/Installation)

### Contributing

Please send your feedback on our [mailing list](https://groups.google.com/g/nussknacker).
Issues and pull request can be reported on our [project page](https://github.com/TouK/nussknacker)

