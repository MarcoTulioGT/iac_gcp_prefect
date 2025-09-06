from prefect import flow

@flow
def my_flow():
    print("Hola Prefect local")

if __name__ == "__main__":
    my_flow.deploy(
        name="local-deployment",
        work_pool_name="default-local-pool",
        tags=["dev"],
        push=True

    )
