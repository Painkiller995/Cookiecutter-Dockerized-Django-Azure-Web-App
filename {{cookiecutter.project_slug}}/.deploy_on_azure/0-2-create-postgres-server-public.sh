#!/bin/bash

# Read Azure variables from .envs folder
echo "INFO:: Read Azure variables from .envs folder"
source .envs/.production/azure/.resources


# # Login to Azure
# echo "INFO:: Login to Azure"
# az login

#Create a PostgreSQL flexible server with public access.
echo "INFO:: Create a PostgreSQL flexible server with public access."

echo "INFO:: Virtual network integration is only supported on Basic and higher plans. Virtual network integration is not supported with multi-container (Docker Compose) apps."

az postgres flexible-server create \
   --resource-group $RESOURCE_GROUP_NAME \
   --name $AZURE_POSTGRESQL_HOST  \
   --location $LOCATION \
   --admin-user $AZURE_POSTGRESQL_USERNAME \
   --admin-password $AZURE_POSTGRESQL_PASSWORD \
   --sku-name Standard_D2s_v3 \
   --public-access 0.0.0.0

echo "INFO:: Created PostgreSQL database server: $AZURE_POSTGRESQL_HOST."
 
 
 
 