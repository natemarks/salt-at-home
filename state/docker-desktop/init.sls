docker.packages:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - ca-certificates
      - curl
      - gnupg-agent
      - software-properties-common

docker.repo:
  pkgrepo.managed:
    - humanname: Docker Repo
    - baseurl: https://download.docker.com/linux/ubuntu
    - gpgkey: https://download.docker.com/linux/ubuntu/gpg
    - gpgcheck: 1