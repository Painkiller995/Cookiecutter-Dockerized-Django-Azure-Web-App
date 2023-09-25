#!/bin/bash

# Read Azure variables from .envs folder
echo "INFO:: Read Azure variables from .envs folder"
source .envs/.production/azure/.resources

echo "INFO:: Install or update the Azure Container Apps extension for the CLI."
az extension add --name containerapp --upgrade

# Create Resource Group
if [ $(az group exists --name $RESOURCE_GROUP_NAME) = false ]; then 
   az group create --name $RESOURCE_GROUP_NAME --location "$LOCATION" 
else
   echo "${RESOURCE_GROUP_NAME} is already existed, making a new one will be ignored"
fi