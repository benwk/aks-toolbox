#!/bin/bash

az login --service-principal --username "${AZURE_APP_ID}" --password "${AZURE_PASSWORD}" --tenant "${AZURE_TENANT_ID}"
az aks get-credentials --resource-group "{$AZURE_RESOURCE_GROUP}" --name "{$AZURE_AKS_NAME}"
kubectl port-forward "${POD_NAME}" --namespace "${POD_NAMESPACE}" "${LOCAL_PORT}":"${POD_PORT}" --address='0.0.0.0'