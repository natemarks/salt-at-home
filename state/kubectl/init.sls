
kubectl.repo:
  pkgrepo.managed:
    - name: "deb http://apt.kubernetes.io/ kubernetes-xenial main"
    - humanname: Kubectl Repo
    - key_url: https://packages.cloud.google.com/apt/doc/apt-key.gpg
    - gpgcheck: 1

kubectl.prerequisites:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - gnupg2
      - curl

kubectl.packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - kubectl
    - require:
      - kubectl.repo