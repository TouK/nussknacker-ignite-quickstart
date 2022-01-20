ARG BASE_IMAGE=flink:1.14.0-scala_2.12-java11
FROM $BASE_IMAGE

RUN curl -s https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.18/postgresql-42.2.18.jar -o /opt/flink/lib/postgresql-42.2.18.jar
RUN curl -s https://repo1.maven.org/maven2/org/apache/ignite/ignite-core/2.10.0/ignite-core-2.10.0.jar -o /opt/flink/lib/ignite-core-2.10.0.jar
