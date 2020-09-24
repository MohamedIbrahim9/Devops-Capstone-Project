#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=mohamedibrahim9/devops-capstone-app
# Step 2
# create a deployment from this YAML file.
kubectl create -f deploy.yaml

#You can check Deployment with the following command:
kubectl get deploy,po
# kubectl run node-web-app --image=$dockerpath --port=49160


#Expose The Deployment To The Internet
kubectl expose deployment nodejs-deployment --type="LoadBalancer"

# List kubernetes pods
kubectl get pods 


#Get application pod name 
POD=$(kubectl get pods | awk '{print$1}' | grep 'node*')

#Print pod name
echo $POD 


#Forward pod to specifc port
kubectl port-forward $POD 49161:8080