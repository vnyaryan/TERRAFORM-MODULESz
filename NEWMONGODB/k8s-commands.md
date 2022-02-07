### kubectl apply commands in order
    
    kubectl apply -f mongo-secret.yaml
    kubectl apply -f mongo.yaml
    kubectl apply -f mongo-configmap.yaml 
    kubectl apply -f mongo-express.yaml

### kubectl get commands

    kubectl get pod
    kubectl get pod --watch
    kubectl get pod -o wide
    kubectl get service
    kubectl get secret
    kubectl get all | grep mongodb

### kubectl debugging commands

    kubectl describe pod mongodb-deployment-xxxxxx
    kubectl describe service mongodb-service
    kubectl logs mongo-express-xxxxxx

### give a URL to external service in minikube

    minikube service mongo-express-service





    ENABLE ADDONS FOR KEYVAULT - 
az aks enable-addons --addons azure-keyvault-secrets-provider --name aks-crd-dev-001 --resource-group rg-aks-int-001

CHECK USER-DEFINED MANAGED IDENTITY 
az aks show -g  rg-aks-int-001 -n aks-crd-dev-001 --query addonProfiles.azureKeyvaultSecretsProvider.identity.clientId -o tsv

ASSIGN "GET" ACCESS  TO   IDENTITY    IN KEY VAULT ACCESS POLICY  
CREATE SECRET IN KEY VAULT 

mongo-root-username: dXNlcm5hbWU=
mongo-root-password: cGFzc3dvcmQ=

CONNECT TO PORTAL USING AZ LOGIN 


SET DEFAULT SUBCRIPTION 
az account set --subscription 73fe470c-a6ec-49c3-8973-4d5e062b6d6b

CONNECT TO AKS CLUSTER 
az aks get-credentials --resource-group rg-aks-int-001 --name aks-crd-dev-001


CREATE NAMESPACE 
kubectl create namespace mongodb

SET NAMESPACE AS DEFAULT 

kubectl config set-context --current --namespace=mongodb


UPDATE SERVICE PROVIDE YAML FILE WITH NEW IDENTITY  CLIENT ID 



APPLY SERVICE PROVIDER YAML   and CONFIG MAP 

kubectl apply -f secretProviderClass-new.yml
kubectl apply -f mongo-configmap.yaml 
kubectl apply -f mongo.yaml
kubectl apply -f mongo-express.yaml









ENABLE ADMIN IN ACR 
COPY USERNAME AND PASSWORD AND SAVE IN NOTEPAD 

Validate an ACR is accessible from an AKS cluster.
az aks check-acr --name aks-crd-dev-001 --resource-group rg-aks-int-001 --acr crcrdint001.azurecr.io


IMPORT   IMAGE FROM DOCKER TO ACR 
az acr import  -n <acr-name> --source docker.io/library/nginx:latest --image nginx:v1

az acr import  -n crcrdint001.azurecr.io --source docker.io/library/nginx:latest --image nginx:v1



CREATE NGINX YAML FILE  USING IMAGE FROM ACR REPOSITORY 

APPLY  YAML FILE 

kubectl apply -f acr-nginx.yaml

CHECK PODS 

kubectl get pods


 
 