#!/bin/bash

# Read Azure variables from .envs folder
echo "INFO:: Read Azure variables from .envs folder"
source .envs/.production/azure/.resources

docker-compose -f ./production.yml build

az acr login --name $ACR_NAME

docker-compose -f ./production.yml push
