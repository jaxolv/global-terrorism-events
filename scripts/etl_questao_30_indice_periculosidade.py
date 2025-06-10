import pandas as pd
from sqlalchemy import create_engine
from scripts.db_connection import create_connection

def read_sql_file(path='sql/questao_30.sql'):
    with open(path, 'r', encoding='utf-8') as file:
        return file.read()

def extract_data():
    raw_conn = create_connection()
    if raw_conn is None:
        raise Exception("Não foi possível conectar ao banco de dados.")
    
    engine = create_engine('postgresql+psycopg2://', creator=lambda: raw_conn)

    query = read_sql_file()
    with engine.connect() as conn:
        df = pd.read_sql_query(query, conn)
    return df

def save_to_csv(df, path='csv/questao_30_indice_periculosidade.csv'):
    df.to_csv(path, index=False)
    print(f'Dados exportados para diretório {path}')

if __name__ == "__main__":
    df = extract_data()
    save_to_csv(df)
