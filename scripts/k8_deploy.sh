#!/bin/bash
cd K8/
kubectl delete deployment frontend -n cneproject
kubectl delete deployment backend -n cneproject
kubectl apply -f namespace.yaml
kubectl apply -f secrets.yaml -n cneproject
kubectl apply -f nginx-conf.yaml -n cneproject
kubectl apply -f load-balancer.yaml -f nginx.yaml -f frontend-cip.yaml -f frontend.yaml -f backend-cip.yaml -f backend.yaml -n cneproject
kubectl get svc -n cneproject
