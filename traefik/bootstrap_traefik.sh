#!/bin/bash
echo "Creating Traefik objects"
microk8s kubectl apply -f traefik_rbac_clusterrole_and_binding.yml
microk8s kubectl apply -f traefik_serviceaccount_daemonset_and_service.yml
microk8s kubectl apply -f traefik_web_ui_service_and_ingress.yml