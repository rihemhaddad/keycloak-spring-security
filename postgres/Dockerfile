FROM postgres:12-alpine

ENV POSTGRES_DB keycloak
ENV POSTGRES_USER keycloak
ENV POSTGRES_PASSWORD keycloak

ADD keycloak-insert.sql /docker-entrypoint-initdb.d/0_init.sql
