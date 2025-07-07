FROM mysql:8.0

ENV MYSQL_ROOT_PASSWORD=MySQLPassword \
    MYSQL_DATABASE=sistem_za_regrutaciju

COPY dump.sql /docker-entrypoint-initdb.d/

EXPOSE 3306