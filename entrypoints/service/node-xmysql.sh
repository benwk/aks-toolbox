#!/bin/bash

az login --service-principal --username "${AZURE_APP_ID}" --password "${AZURE_PASSWORD}" --tenant "${AZURE_TENANT_ID}"
az aks get-credentials --resource-group "${AZURE_RESOURCE_GROUP}" --name "${AZURE_AKS_NAME}"
kubectl apply -f /work/mysql-external.yaml --namespace "${POD_NAMESPACE}"
sleep 5s
export MYSQL_IP=$(kubectl get svc --namespace "${POD_NAMESPACE}" mysql-external -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
xmysql -h "$MYSQL_IP" -o 13306 -u root -p bite -d bitestream_server_account -r 0.0.0.0