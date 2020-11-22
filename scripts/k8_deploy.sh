#!/bin/bash
cd K8/
kubectl destroy -f load-balancer.yaml -f nginx.yaml -f frontend.yaml -f frontend-cip.yaml -f backend.yaml -f backend-cip.yaml
kubectl destroy -f nginx-conf.yaml -n cneproject
kubectl destroy -f secrets.yaml
kubectl destroy -f namespace.yaml
kubectl apply -f namespace.yaml
kubectl apply -f secrets.yaml -n cneproject
kubectl apply -f load-balancer.yaml -f nginx-conf.yaml -f nginx.yaml -n cneproject
kubectl apply -f frontend-cip.yaml -f frontend.yaml -n cneproject
kubectl apply -f backend-cip.yaml -f backend.yaml -n cneproject
kubectl get svc -n cneproject
