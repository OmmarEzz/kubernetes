#!/bin/bash
echo "initializing k8s"

kubeadm init  --upload-certs
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

