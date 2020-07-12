{% set version = salt['pillar.get']('terragrunt:version') %}


/opt/terragrunt:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: True

/opt/terragrunt/terragrunt-{{ version }}:
  file.managed:
    - source: https://github.com/gruntwork-io/terragrunt/releases/download/{{ version }}/terragrunt_linux_amd64
    - source_hash: https://github.com/gruntwork-io/terragrunt/releases/download/{{ version }}/SHA256SUMS
    - mode: 755
    - require:
      - /opt/terragrunt

install_terragrunt:
  alternatives.install:
    - name: terragrunt
    - link: /usr/bin/terragrunt
    - path: /opt/terragrunt/terragrunt-{{ version }}
    - priority: 30
    - require:
      - /opt/terragrunt/terragrunt-{{ version }}

set_terragrunt:
  alternatives.set:
    - name: terragrunt
    - path: /opt/terragrunt/terragrunt-{{ version }}
