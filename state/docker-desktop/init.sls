docker.repo:
  pkgrepo.managed:
    - name: "deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ salt['grains.get']('oscodename')}} stable"
    - humanname: Docker Repo
    - baseurl: https://download.docker.com/linux/ubuntu
    - key_url: https://download.docker.com/linux/ubuntu/gpg
    - key_id: 0EBFCD88
    - gpgcheck: 1

docker.prerequisites:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - ca-certificates
      - curl
      - gnupg-agent
      - software-properties-common

docker.packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - docker-ce
      - docker-ce-cli
      - containerd.io
    - require:
      - docker.repo
