import os
import mysql.connector
from flask import Flask


app = Flask(__name__)

@app.route('/')
def healthcheck():
    # Use the hostname 'mysql', not 'localhost'
    connection = mysql.connector.connect(
        host=os.getenv("MYSQL_HOST", "127.0.0.1"),  # Postavi ovde tačan host
        port=os.getenv("MYSQL_PORT", 3306),  # Uveri se da je port 3306
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