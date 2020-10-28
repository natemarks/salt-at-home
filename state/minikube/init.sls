{% set version = salt['pillar.get']('minikube:version') %}

minikube_pkg:
  pkg.installed:
    - sources:
      - minikube: https://github.com/kubernetes/minikube/releases/download/v{{ version }}/minikube_{{ version }}-0_amd64.deb