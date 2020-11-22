#!/bin/bash
cd K8/
sudo kubectl get svc
sudo kubectl apply -f namespace.yaml
sudo kubectl apply -f secrets.yaml
sudo kubectl apply -f nginx-conf.yaml
sudo kubectl apply -f load-balancer.yaml -f nginx.yaml -f frontend-cip.yaml -f frontend.yaml -f backend-cip.yaml -f backend.yaml
sudo kubectl describe service load-balancer -n cneproject
