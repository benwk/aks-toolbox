#!/bin/bash

az login -u "${AZURE_USERNAME}" -p "${AZURE_PASSWORD}"
az aks get-credentials --resource-group "${AZURE_RESOURCE_GROUP}" --name "${AZURE_AKS_NAME}"
kubectl apply -f /work/mysql-external.yaml --namespace "${POD_NAMESPACE}"
sleep 5s
export MYSQL_IP=$(kubectl get svc --namespace "${POD_NAMESPACE}" mysql-external -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
xmysql -h "$MYSQL_IP" -o 13306 -u root -p bite -d bitestream_server_account -r 0.0.0.0