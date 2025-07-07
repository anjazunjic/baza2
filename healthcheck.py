import os
import mysql.connector
from flask import Flask

app = Flask(__name__)

@app.route('/')
def healthcheck():
    # Use the correct MySQL hostname from Render, instead of localhost
    connection = mysql.connector.connect(
        host=os.getenv("MYSQL_HOST", "your_render_mysql_url_or_ip"),  # Replace with your actual Render MySQL hostname
        user=os.getenv("MYSQL_USER", "root"),  # Use the correct MySQL username
        password=os.getenv("MYSQL_PASSWORD", "MySQLPassword"),  # Use the correct MySQL password
        database=os.getenv("MYSQL_DATABASE", "sistem_za_regrutaciju")  # Use the correct database name
    )

    cursor = connection.cursor()
    cursor.execute("SELECT 'Hello from Flask and MySQL!'")
    result = cursor.fetchone()
    connection.close()

    return result[0]

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)