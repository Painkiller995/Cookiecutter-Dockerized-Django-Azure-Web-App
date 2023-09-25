#!/bin/bash

# Read Azure variables from .envs folder
echo "INFO:: Read Azure variables from .envs folder"
source .envs/.production/azure/.resources
source .envs/.production/backend/.django

# Display DJANGO_SECRET_KEY
echo "INFO: DJANGO_SECRET_KEY"

echo "----------------------------------------------"
echo "$DJANGO_SECRET_KEY"
echo "----------------------------------------------"

# Get sign-in credentials for Azure Container Registry.
ACR_USERNAME=$(az acr credential show --name $ACR_NAME --query username --output tsv)
ACR_PASSWORD=$(az acr credential show --name $ACR_NAME --query passwords[1].value --output tsv)

# Set environment variables
ENV_VARS="DJANGO_SECRET_KEY=$DJANGO_SECRET_KEY \
          DJANGO_SECURE_SSL_REDIRECT=$DJANGO_SECURE_SSL_REDIRECT \
          DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE \
          DJANGO_ADMIN_URL=$DJANGO_ADMIN_URL \
          RUNNING_IN_PRODUCTION=$RUNNING_IN_PRODUCTION \
          ALLOWED_HOSTS=$ALLOWED_HOSTS \
          REDIS_URL=$REDIS_URL \
          CELERY_BROKER_URL=$CELERY_BROKER_URL \
          ALLOW_EMPTY_PASSWORD=$ALLOW_EMPTY_PASSWORD \
          AZURE_POSTGRESQL_HOST=$AZURE_POSTGRESQL_HOST.postgres.database.azure.com \
          AZURE_POSTGRESQL_DATABASE=$AZURE_POSTGRESQL_DATABASE \
          AZURE_POSTGRESQL_USERNAME=$AZURE_POSTGRESQL_USERNAME \
          AZURE_POSTGRESQL_PASSWORD=$AZURE_POSTGRESQL_PASSWORD \
          DOCKER_REGISTRY_SERVER_URL=https://$ACR_NAME.azurecr.io \
          DOCKER_REGISTRY_SERVER_USERNAME=$ACR_USERNAME \
          DOCKER_REGISTRY_SERVER_PASSWORD=$ACR_PASSWORD \
          ACR_NAME=$ACR_NAME \
         "

 
# Set environment variables using Azure CLI
az webapp config appsettings set --resource-group $RESOURCE_GROUP_NAME --name $WEB_APP_NAME --settings $ENV_VARS