


# Create SPN for the project
az ad sp create-for-rbac --name "gh-spn" --role contributor --scopes /subscriptions/db8fcd00-4f68-42c3-8b19-947bf4d7b2c5 --sdk-auth
