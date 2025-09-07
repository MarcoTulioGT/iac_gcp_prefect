# flows/database.py
from prefect import flow, task, get_run_logger
import psycopg2
import os

@task
def query_postgres():
    db_host = os.getenv("DB_HOST")
    logger = get_run_logger()
    logger.info("Inicio del flujo")
    logger.info(f"DB_HOST: {db_host}")
    conn = psycopg2.connect(
        host=db_host,       # o IP de tu servidor
        database="test_db",
        user="test_user",
        password="testuser25",
        port=5432
    )
    cur = conn.cursor()
    cur.execute("SELECT nombre, salario, correo_electronico, dpi, fecha_contratacion FROM empleados LIMIT 5;")
    rows = cur.fetchall()
    logger.info(rows)
    cur.close()
    conn.close()
    return rows


@flow
def my_flow():
    logger = get_run_logger()
    logger.info(f"Hello,!")
    resultados = query_postgres()
    logger.info("Resultados:", resultados)

if __name__ == "__main__":
    my_flow()


