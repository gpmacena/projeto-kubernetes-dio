#!/bin/bash
echo "Criando as imagens........."

docker build -t gpmacena/projeto-backend:1.0 backend/.
docker build -t gpmacena/projeto-database:1.0 database/.

echo "Realizando o push das imagens....."

docker push gpmacena/projeto-backend:1.0
docker push gpmacena/projeto-database:1.0

echo "Criando o serviço no cluster Kubernetes"

kubectl apply -f ./services.yml

echo "Criando os deployments....."

kubectl apply -f ./deployment.yml
