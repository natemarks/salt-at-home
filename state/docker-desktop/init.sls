{% set version = salt['pillar.get']('docker-compose:version') %}

docker.repo:
  pkgrepo.managed:
    - name: "deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ salt['grains.get']('oscodename')}} stable"
    - humanname: Docker Repo
    - key_url: https://download.docker.com/linux/ubuntu/gpg
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

/opt/docker-compose:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: True

/opt/docker-compose/docker-compose-{{ version }}:
  file.managed:
    - source: https://github.com/docker/compose/releases/download/{{ version }}/docker-compose-{{ salt['grains.get']('kernel')}}-{{ salt['grains.get']('cpuarch')}}
    - source_hash: https://github.com/docker/compose/releases/download/{{ version }}/docker-compose-{{ salt['grains.get']('kernel')}}-{{ salt['grains.get']('cpuarch') }}.sha256
    - mode: 755
    - require:
      - /opt/docker-compose

docker-compose_install_alternative:
  alternatives.install:
    - name: docker-compose
    - link: /usr/bin/docker-compose
    - path: /opt/docker-compose/docker-compose-{{ version }}
    - priority: 30
    - require:
      - /opt/docker-compose/docker-compose-{{ version }}

docker-compose_set_alternative:
  alternatives.set:
  - name: docker-compose
  - path: /opt/docker-compose/docker-compose-{{ version }}

docker_user:
  user.present:
    - name: {{ grains['BI_USER_NAME'] }}
    - groups:
      - docker
      - {{ grains['BI_USER_NAME'] }}
      - adm
      - cdrom
      - sudo
      - dip
      - plugdev
      - lpadmin
      - lxd
      - sambashare
    - require:
      - docker.packages
