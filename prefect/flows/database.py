# flows/database.py
from prefect import flow

@flow
def my_flow():
    print("Hola Prefect local")

if __name__ == "__main__":
    my_flow()
