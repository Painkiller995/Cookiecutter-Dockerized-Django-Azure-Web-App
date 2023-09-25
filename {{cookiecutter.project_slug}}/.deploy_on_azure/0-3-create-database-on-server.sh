#!/bin/bash

# Read Azure variables from .envs folder
echo "INFO:: Read Azure variables from .envs folder"
source .envs/.production/azure/.resources


# Create a database on the server
az postgres flexible-server db create \
   --resource-group $RESOURCE_GROUP_NAME \
   --server-name $AZURE_POSTGRESQL_HOST \
   --database-name $AZURE_POSTGRESQL_DATABASE

echo "INFO:: Completed creating database $AZURE_POSTGRESQL_DATABASE on PostgreSQL server: $AZURE_POSTGRESQL_HOST."

 