#!/bin/bash

az container create --resource-group $ACR_RG --name 1upwebapp --image "$ACR_NAME.azurecr.io/1upwebapp:build-$BUILD_NUMBER" --cpu 1 --memory 1 --registry-login-server "$ACR_NAME.azurecr.io" --registry-username $SP_APP_ID --registry-password $SP_PASSWD --dns-name-label 1upwebapp --ports 3000

# Query creation status
#az container show --resource-group $ACR_RG --name 1upwebapp --query instanceView.state

# Remove when done (don't prompt)
#az container delete --name 1upwebapp --resource-group $ACR_RG --yes
