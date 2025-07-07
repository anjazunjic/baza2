import os
from flask import Flask
import mysql.connector

app = Flask(__name__)

@app.route('/')
def healthcheck():
    # Poveži se na MySQL
    connection = mysql.connector.connect(
        host=os.environ.get("MYSQL_HOST", "localhost"),  # Varijabla okruženja za MySQL host
        user=os.environ.get("MYSQL_USER", "root"),      # Varijabla okruženja za MySQL korisnika
        password=os.environ.get("MYSQL_PASSWORD", "MySQLPassword"),  # Varijabla okruženja za MySQL lozinku
        database=os.environ.get("MYSQL_DATABASE", "sistem_za_regrutaciju")  # Varijabla okruženja za MySQL bazu
    )
    cursor = connection.cursor()
    cursor.execute("SELECT 'Hello from Flask and MySQL!'")
    result = cursor.fetchone()
    connection.close()
    return result[0]

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)