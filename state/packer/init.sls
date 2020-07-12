{% set version = salt['pillar.get']('packer:version') %}

extract_packer:
  archive.extracted:
    - name: /opt/packer/{{ version }}
    - source: https://releases.hashicorp.com/packer/{{ version }}/packer_{{ version }}_linux_amd64.zip
    - source_hash: https://releases.hashicorp.com/packer/{{ version }}/packer_{{ version }}_SHA256SUMS
    - user: root
    - group: users
    - enforce_toplevel: False

install_packer:
  alternatives.install:
    - name: packer
    - link: /usr/bin/packer
    - path: /opt/packer/{{ version }}/packer
    - priority: 30
    - require:
      - archive: extract_packer

set_packer:
  alternatives.set:
    - name: packer
    - path: /opt/packer/{{ version }}/packer
