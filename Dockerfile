FROM mysql:8.0

# Obavezna root lozinka + kreiranje baze
ENV MYSQL_ROOT_PASSWORD=MySQLPassword
    MYSQL_DATABASE=sistem_za_regrutaciju

# Automatski import dump-a u bazu
COPY dump.sql /docker-entrypoint-initdb.d/

# Otvori port 3306
EXPOSE 3306