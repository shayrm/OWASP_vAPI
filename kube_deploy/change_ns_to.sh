#!/bin/bash

echo "list current namespaces:"
echo ""

kubectl get ns

echo "change ns to $1"
sudo kubectl config set-context --current --namespace $1
