
# Read Azure variables from .envs folder
echo "INFO:: Read Azure variables from .envs folder"
source .envs/.production/azure/.resources

az webapp create --resource-group $RESOURCE_GROUP_NAME \
--plan $APP_SERVICE_PLAN \
--name $WEB_APP_NAME \
--multicontainer-config-type compose \
--multicontainer-config-file ./production.yml \
