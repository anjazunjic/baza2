# Koristi službeni MySQL Docker image
FROM mysql:8.0

# Postavi ENV varijable za konfiguraciju MySQL baze
ENV MYSQL_ROOT_PASSWORD=MySQLPassword
ENV MYSQL_DATABASE=mydatabase 

# Kopiraj dump fajl u kontejner
COPY dump.sql /docker-entrypoint-initdb.d/

# Otvori port za MySQL
EXPOSE 3306