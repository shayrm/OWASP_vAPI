#!/bin/bash

eksctl create cluster \
	--name Shay-vAPI \
	--nodegroup-name vapi-ngroup \
	--node-type t2.micro \
	--nodes 1 \
	--ssh-access=true \
	--ssh-public-key=$PUB_KEY

# to delete run:
# eksctl delete cluster --region=eu-west-1 --name=Shay-vAPI-test
#or 
# eksctl create cluster -f k8s_eks_cluster.yaml
