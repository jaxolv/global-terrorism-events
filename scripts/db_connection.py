from dotenv import load_dotenv
import os
import psycopg2

load_dotenv()

db_name = os.getenv("DB_NAME")
db_user = os.getenv("DB_USER")
db_pass = os.getenv("DB_PASS")

def create_connection():
    try:
        conn = psycopg2.connect(
            dbname=db_name,
            user=db_user,
            password=db_pass,
            host="localhost",
            port="5432"
        )
        print("Conexão estabelecida.")
        return conn
    except Exception as e:
        print("Falha de conexão.")
        print(e)
        return None