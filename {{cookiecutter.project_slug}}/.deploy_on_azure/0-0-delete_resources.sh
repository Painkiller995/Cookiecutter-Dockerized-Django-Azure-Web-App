#!/bin/bash

# This script deletes the resources created
# Make sure you are logged in to Azure. If unsure, run "az login" before using this script.

echo "Where is the name of the resource group to delete?"
read RESOURCE_GROUP

az group delete --name $RESOURCE_GROUP --yes
echo "INFO:: Deleted resource group: $RESOURCE_GROUP."

