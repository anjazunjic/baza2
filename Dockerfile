# Koristi MySQL image kao osnovu
FROM mysql:8.0

# Postavi environment varijable za MySQL
ENV MYSQL_ROOT_PASSWORD=MySQLPassword
ENV MYSQL_DATABASE=sistem_za_regrutaciju

# Kopiraj dump.sql za inicijalizaciju baze
COPY dump.sql /docker-entrypoint-initdb.d/

# Instaliraj Python i potrebne biblioteke za health check server
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install flask mysql-connector-python

# Kopiraj Python skriptu koja radi kao health check server
COPY healthcheck.py /healthcheck.py

# Otvori potrebne portove
EXPOSE 3306    # Port za MySQL
EXPOSE 8080    # Port za HTTP server

# Pokreni MySQL server i Python HTTP server (health check server)
CMD ["bash", "-c", "mysqld & python3 /healthcheck.py"]