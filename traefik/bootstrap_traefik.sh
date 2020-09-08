#!/bin/bash
echo "Creating Traefik objects"
microk8s kubectl apply -f traefik_crd.yml
microk8s kubectl apply -f traefik_rbac_clusterrole_and_binding.yml
microk8s kubectl apply -f traefik_serviceaccount_daemonset_and_service.yml
microk8s kubectl apply -f traefik_web_ui_service_and_ingress.yml

echo "Forwarding Kubernetes-Dashboard to localhost"
microk8s kubectl port-forward -n kube-system service/traefik-web-ui-svc 8888:8080
echo "You can view the Traefik Web UI at https://localhost:8888"