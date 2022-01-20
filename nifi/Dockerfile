ARG BASE_IMAGE=apache/nifi:1.12.1
FROM $BASE_IMAGE

RUN mkdir -p /opt/nifi/nifi-current/storage/lib/
RUN mkdir -p /opt/nifi/nifi-current/extra-nars
RUN curl -s https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.18/postgresql-42.2.18.jar -o /opt/nifi/nifi-current/storage/lib/postgresql-42.2.18.jar
RUN curl -s https://repo1.maven.org/maven2/org/apache/ignite/ignite-core/2.10.0/ignite-core-2.10.0.jar -o /opt/nifi/nifi-current/storage/lib/ignite-core-2.10.0.jar
RUN curl -s https://repo1.maven.org/maven2/pl/touk/nifi-ignite-nar/0.2.3/nifi-ignite-nar-0.2.3.nar -o /opt/nifi/nifi-current/extra-nars/nifi-ignite-nar-0.2.3.nar
RUN curl -s https://repo1.maven.org/maven2/pl/touk/nifi-ignite-services-api-nar/0.2.3/nifi-ignite-services-api-nar-0.2.3.nar -o /opt/nifi/nifi-current/extra-nars/nifi-ignite-services-api-nar-0.2.3.nar
RUN curl -s https://repo1.maven.org/maven2/pl/touk/nifi-ignite-services-nar/0.2.3/nifi-ignite-services-nar-0.2.3.nar -o /opt/nifi/nifi-current/extra-nars/nifi-ignite-services-nar-0.2.3.nar
