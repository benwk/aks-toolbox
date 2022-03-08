#!/bin/bash

az login -u "${AZURE_USERNAME}" -p "${AZURE_PASSWORD}"
az aks get-credentials --resource-group bite --name develop
kubectl port-forward "${POD_NAME}" --namespace "${POD_NAMESPACE}" "${LOCAL_PORT}":"${POD_PORT}" --address='0.0.0.0'