
# Read Azure variables from .envs folder
echo "INFO:: Read Azure variables from .envs folder"
source .envs/.production/azure/.resources

az appservice plan create --name $APP_SERVICE_PLAN --resource-group $RESOURCE_GROUP_NAME --sku S1 --is-linux
