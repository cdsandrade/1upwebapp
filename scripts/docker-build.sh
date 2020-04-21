#!/bin/bash

export BUILD_NUMBER=$((BUILD_NUMBER+1))

sed -e "s/insert_client_id/$ONEUP_DEMOWEBAPPLOCAL_CLIENTID/" config.json.example > config.json
docker build --no-cache -t 1upwebapp:build-$BUILD_NUMBER .
#docker tag 1upwebapp:build-$BUILD_NUMBER $AWS_ACCOUNT.dkr.ecr.us-east-1.amazonaws.com/1upwebapp:build-$BUILD_NUMBER
docker tag 1upwebapp:build-$BUILD_NUMBER $ACR_NAME.azurecr.io/1upwebapp:build-$BUILD_NUMBER
#docker push $AWS_ACCOUNT.dkr.ecr.us-east-1.amazonaws.com/1upwebapp:build-$BUILD_NUMBER
docker push $ACR_NAME.azurecr.io/1upwebapp:build-$BUILD_NUMBER
