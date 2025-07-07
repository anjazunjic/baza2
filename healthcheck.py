from flask import Flask
import mysql.connector

app = Flask(__name__)

@app.route('/')
def health_check():
    try:
        # Poveži se sa MySQL serverom
        conn = mysql.connector.connect(
            host="localhost",  # MySQL server je u istom kontejneru
            user="root",
            password="MySQLPassword",
            database="sistem_za_regrutaciju"
        )
        if conn.is_connected():
            return "MySQL server is up and running!"
        else:
            return "Failed to connect to MySQL."
    except Exception as e:
        return f"Error: {str(e)}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)