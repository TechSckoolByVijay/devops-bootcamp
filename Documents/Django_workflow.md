
# Django Application CICD Workflow
This GitHub Actions workflow is designed to automate the CI/CD (Continuous Integration/Continuous Deployment) process for a Django application. It includes steps for building a Docker image, deploying to an Azure Kubernetes Service (AKS) cluster, and managing Kubernetes resources.

## Trigger
The workflow is triggered when there is a push event to the main branch, specifically when changes are made to the ApplicationCode/Services/Django-app/shopping_cart/ directory. Additionally, it can also be manually triggered using the "workflow_dispatch" event.

## Environment Variables
The following environment variables are used in the workflow:

AZURE_CONTAINER_REGISTRY: The name of the Azure Container Registry where the Docker image will be pushed.
NAMESPACE: The Kubernetes namespace where the application will be deployed.
CLUSTER_NAME: The name of the Azure Kubernetes Service cluster.
CONTAINER_NAME: The name of the Docker container.
RESOURCE_GROUP: The name of the Azure resource group.
IMAGE_PULL_SECRET_NAME: The name of the Kubernetes secret used for pulling the Docker image.
Job: createSecret
This job is responsible for creating the Kubernetes secret required for pulling the Docker image from the Azure Container Registry.

It logs in to Azure using the provided service principal credentials.
Retrieves the kubeconfig file for the specified Azure Kubernetes Service cluster.
Checks if the namespace exists and creates it if it doesn't.
Gets the Azure Container Registry credentials and stores them in ACR_USERNAME and ACR_PASSWORD variables.
Creates a Kubernetes secret using the Azure/k8s-create-secret action, providing the necessary parameters.
Job: deploy
This job handles the deployment of the Django application to the Azure Kubernetes Service cluster.

Checks out the code repository.
Logs in to Azure using the provided service principal credentials.
Builds the Docker image using the Azure CLI command az acr build, specifying the image name and registry.
Sets the working directory to ApplicationCode/Services/Django-app/shopping_cart.
Gets the kubeconfig file for the specified Azure Kubernetes Service cluster.
Deploys the application using the Azure/k8s-deploy action, specifying the deployment action, namespace, manifests, Docker image, and image pull secret.
Permissions
The workflow requires the following permissions:

contents: read: Allows reading the repository contents.
id-token: write: Allows writing the ID token for authentication.
It is recommended to review and adjust the permissions based on your specific requirements and security considerations.

Please note that the workflow assumes you have already set up the necessary Azure credentials and permissions for performing the deployment tasks.

Feel free to customize the workflow as per your project's requirements, such as adjusting the paths, environment variables, and deployment configurations.