#!/bin/bash

# Read Azure variables from .envs folder
echo "INFO:: Read Azure variables from .envs folder"
source .envs/.production/azure/.resources

# Create a container registry
echo "INFO::Create a container registry"
az acr create \
--resource-group $RESOURCE_GROUP_NAME \
--name $ACR_NAME \
--sku Basic \
--admin-enabled

echo "INFO:: Created container registry: $ACR_NAME."
