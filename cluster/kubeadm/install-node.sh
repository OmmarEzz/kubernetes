#!/bin/bash
echo "initializing k8s"

kubeadm init
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
