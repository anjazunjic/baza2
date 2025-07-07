from flask import Flask
import mysql.connector
import os

app = Flask(__name__)

@app.route('/')
def healthcheck():
    # Poveži se na MySQL koristeći environment varijable
    connection = mysql.connector.connect(
        host=os.getenv("MYSQL_HOST", "localhost"),  # Ako ne postoji MYSQL_HOST, koristi localhost
        user=os.getenv("MYSQL_USER", "root"),
        password=os.getenv("MYSQL_PASSWORD", "MySQLPassword"),
        database=os.getenv("MYSQL_DATABASE", "sistem_za_regrutaciju")
    )
    
    cursor = connection.cursor()
    cursor.execute("SELECT 'Hello from Flask and MySQL!'")
    result = cursor.fetchone()
    connection.close()
    
    return result[0]

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)