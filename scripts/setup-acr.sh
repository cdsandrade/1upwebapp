#!/bin/bash

export ACR_RG=""
export ACR_NAME=""
export AZ_REGION=""

# Create the Azure Container Registry
#az login
az group create --name $ACR_RG --location $AZ_REGION
az acr create --resource-group $ACR_RG --name $ACR_NAME --sku Basic
az acr login --name $ACR_NAME  # also logs in Docker to the registry/repo

# Set up service principal for rights to pull docker image + deploy container in Azure
SERVICE_PRINCIPAL_NAME="acr-1up-sp"
ACR_REGISTRY_ID=$(az acr show --name $ACR_NAME --query id --output tsv)
export SP_PASSWD=$(az ad sp create-for-rbac --name http://$SERVICE_PRINCIPAL_NAME --scopes $ACR_REGISTRY_ID --role acrpull --query password --output tsv)
export SP_APP_ID=$(az ad sp show --id http://$SERVICE_PRINCIPAL_NAME --query appId --output tsv)
