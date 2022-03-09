# Azure Kubernetes Toolbox

## Guide

Use docker with envs to manage AKS

### Port Forward

Used to connect pods in AKS

> Copy and paste the .env.example file as .env with your own information

```shell
# use credentials with AZURE_USERNAME and AZURE_PASSWORD (without MFA)
# or use service principal with AZURE_APP_ID, AZURE_PASSWORD and AZURE_TENANT_ID
$ docker-compose -f port-forward.yaml up -d

# use with local .azure files
$ docker-compose up -d
```

### Node with xmysql (deprecated)

Used to create mysql service with external ip based on node image and connect by xmysql

> Deprecated, only used in special cases

## Tasks

- [x] Basic Image
- [x] Port-forward Image
- [x] AKS cli with Node Image