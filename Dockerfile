# Koristi MySQL image
FROM mysql:8.0

# Postavi environment varijable za MySQL
ENV MYSQL_ROOT_PASSWORD=MySQLPassword
ENV MYSQL_DATABASE=sistem_za_regrutaciju

# Kopiraj dump.sql za inicijalizaciju baze
COPY dump.sql /docker-entrypoint-initdb.d/

# Kopiraj Python skriptu koja radi kao health check server
COPY healthcheck.py /healthcheck.py

# Otvori potrebne portove
EXPOSE 3306    # Port za MySQL
EXPOSE 8080    # Port za HTTP server

# Pokreni MySQL server i Python HTTP server
CMD ["bash", "-c", "mysqld & python3 /healthcheck.py"]