#!/bin/bash
cd K8/
kubectl apply -f secrets.yaml -n cneproject
kubectl apply -f load-balancer.yaml -f nginx.conf.yaml -f nginx.yaml -n cneproject
kubectl apply -f frontend-cip.yaml -f frontend.yaml -n cneproject
kubectl apply -f backend-cip.yaml -f backend.yaml -n cneproject
kubectl get svc -n cneproject
