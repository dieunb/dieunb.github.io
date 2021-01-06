FROM postgres:9.6.17-alpine

ENV POSTGRES_DB='ruby_mvc_development'
ENV POSTGRES_USER='stepup_devs'
ENV POSTGRES_PASSWORD='123456'

COPY northwind.sql /docker-entrypoint-initdb.d/northwind.sql
