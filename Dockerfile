FROM mysql:8.0

ENV MYSQL_ROOT_PASSWORD=MySQLPassword
ENV MYSQL_DATABASE=sistem_za_regrutaciju

EXPOSE 3306

CMD ["mysqld"]
