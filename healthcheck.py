from flask import Flask
import mysql.connector

app = Flask(__name__)

@app.route('/')
def healthcheck():
    # Poveži se na MySQL
    connection = mysql.connector.connect(
        host="mysql",  # Ime servisa iz docker-compose.yml
        user="root",
        password="MySQLPassword",
        database="sistem_za_regrutaciju"
    )
    cursor = connection.cursor()
    cursor.execute("SELECT 'Hello from Flask and MySQL!'")
    result = cursor.fetchone()
    connection.close()
    return result[0]

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)