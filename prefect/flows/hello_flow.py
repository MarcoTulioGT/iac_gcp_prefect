from prefect import flow

@flow(name="hello-world")
def hello_world():
    print("👋 Hola desde Prefect 3.x!")

if __name__ == "__main__":
    hello_world()
