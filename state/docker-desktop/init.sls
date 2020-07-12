{% set compose_config = salt['pillar.get']('docker-compose') %}
{% set compose_version = compose_config['version'] %}


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

/opt/docker-compose/current:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: True

/opt/docker-compose/docker-compose-{{ scompose_version }}:
  file.managed:
    - source: https://github.com/docker/compose/releases/download/{{ compose_version }}/docker-compose-{{ salt['grains.get']('kernel')}}-{{ salt['grains.get']('cpu_arch')}}
    - source_hash: https://github.com/docker/compose/releases/download/{{ compose_version }}/docker-compose-{{ salt['grains.get']('kernel')}}-{{ salt['grains.get']('cpu_arch')}}.sha256
    - require:
      - /opt/docker-compose/current
