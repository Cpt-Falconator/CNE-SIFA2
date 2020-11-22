#!/bin/bash
cd K8/
kubectl get svc
kubectl apply -f namespace.yaml
kubectl apply -f secrets.yaml
kubectl apply -f nginx-conf.yaml
kubectl apply -f load-balancer.yaml -f nginx.yaml -f frontend-cip.yaml -f frontend.yaml -f backend-cip.yaml -f backend.yaml
kubectl describe service load-balancer -n cneproject
