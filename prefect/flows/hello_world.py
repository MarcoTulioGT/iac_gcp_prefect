from prefect import flow, task
from prefect.blocks.system import Secret
import psycopg2

postgres_host = Secret.load("postgres-host")

DB_HOST = postgres_host.get()

@task
def query_postgres():
    conn = psycopg2.connect(
        host=DB_HOST,   
        database="test_db",
        user="test_user",
        password="testuser25",
        port=5432
    )
    cur = conn.cursor()
    cur.execute("SELECT nombre, salario, correo_electronico, dpi, fecha_contratacion FROM empleados LIMIT 5;")
    rows = cur.fetchall()
    cur.close()
    conn.close()
    return rows

@flow(log_prints=True)
def my_flow(name: str = "world"):
    print(f"Hello, {name}!")
    resultados = query_postgres()
    print("Resultados:", resultados)


if __name__ == "__main__":
    my_flow.deploy(
        name="my-deployment",
        work_pool_name="default-docker-pool",
        image="my-registry.com/my-docker-image:my-tag",
        push=False 
    )
