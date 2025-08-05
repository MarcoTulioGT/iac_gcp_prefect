from prefect.deployments import Deployment
from hello import hello_flow

Deployment.build_from_flow(
    flow=hello_flow,
    name="hello-deployment",
    work_pool_name="default-pool"
).apply()
