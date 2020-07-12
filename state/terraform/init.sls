{% set version = {{ pillar['terraform']['version']  }} %}
extract_terraform:
  archive.extracted:
    - name: /opt/terraform/{{ version }}
    - source: https://releases.hashicorp.com/terraform/{{ pillar['terraform']['version']  }}/terraform_{{ pillar['terraform']['version']  }}_linux_amd64.zip
    - source_hash: https://releases.hashicorp.com/terraform/{{ pillar['terraform']['version']  }}/terraform_{{ pillar['terraform']['version']  }}_SHA256SUMS
    - user: root
    - group: users
    - enforce_toplevel: False

install_terraform:
  alternatives.install:
    - name: terraform
    - link: /usr/bin/terraform
    - path: /opt/terraform/{{ pillar['terraform']['version']  }}/terraform
    - priority: 30
    - require:
      - archive: extract_terraform

set_terraform:
  alternatives.set:
    - name: terraform
    - path: /opt/terraform/{{ pillar['terraform']['version']  }}/terraform
