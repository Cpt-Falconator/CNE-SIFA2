#!/bin/bash
cd K8/
sudo kubectl destroy -f load-balancer.yaml -f nginx.yaml -f frontend.yaml -f frontend-cip.yaml -f backend.yaml -f backend-cip.yaml
sudo kubectl destroy -f nginx-conf.yaml -n cneproject
sudo kubectl destroy -f secrets.yaml
sudo kubectl destroy -f namespace.yaml
sudo kubectl apply -f namespace.yaml
sudo kubectl apply -f secrets.yaml
sudo kubectl apply -f nginx-conf.yaml -n cneproject
sudo kubectl apply -f load-balancer.yaml -f nginx.yaml -f frontend.yaml -f frontend-cip.yaml -f backend.yaml -f backend-cip.yaml
sudo kubectl describe service load-balancer -n cneproject
sudo kubectl describe deployment nginx -n cneproject
