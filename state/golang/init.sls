include:
  - shell

extract_golang:
  archive.extracted:
    - name: /opt/golang/{{ pillar['golang']['version'] }} 
    - source: https://golang.org/dl/go{{ pillar['golang']['version'] }}.linux-amd64.tar.gz
    - source_hash: aed845e4185a0b2a3c3d5e1d0a35491702c55889192bb9c30e67a3de6849c067
    - user: root
    - group: users
    - enforce_toplevel: False

install_golang:
  file.symlink:
    - name: /opt/golang/current
    - target: /opt/golang/{{ pillar['golang']['version'] }}


{% for shell_dir in ["bashrc.d", "zshrc.d"] %}
/etc/{{ shell_dir }}/golang.sh:
  file.managed:
    - source: salt://golang/files/golang.sh
    - user: root
    - group: root
    - mode: 644
    - backup: minion
    - require:
      - /etc/bashrc.d
      - /etc/zshrc.d
{% endfor %}
