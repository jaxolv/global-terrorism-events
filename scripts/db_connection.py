from dotenv import load_dotenv
import os
import psycopg2

load_dotenv()

db_name = os.getenv("DB_NAME")
db_user = os.getenv("DB_USER")
db_pass = os.getenv("DB_PASS")
db_host = os.getenv("DB_HOST")
db_port = os.getenv("DB_PORT")

def create_connection():
    try:
        conn = psycopg2.connect(
            dbname=db_name,
            user=db_user,
            password=db_pass,
            host=db_host,
            port=db_port
        )
        print("Conexão estabelecida.")
        return conn
    except Exception as e:
        print("Falha de conexão.")
        print(e)
        return None