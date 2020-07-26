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
    - source: salt://golang/files/golang.sh.j2
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - backup: minion
    - require:
      - /etc/{{ shell_dir }}
{% endfor %}

{% for gdir in ['bin', 'src']%}
/home/{{ grains['BI_USER_NAME'] }}/go/{{ gdir }}:
  file.directory:
    - user: {{ grains['BI_USER_NAME'] }}
    - group: {{ grains['BI_USER_NAME'] }}
    - dir_mode: 755
    - makedirs: True
{% endfor %}

/home/{{ grains['BI_USER_NAME'] }}/go/src/{{ pillar['golang']['git_host'] }}/{{ pillar['golang']['git_host_user'] }}:
  file.directory:
    - user: {{ grains['BI_USER_NAME'] }}
    - group: {{ grains['BI_USER_NAME'] }}
    - dir_mode: 755
    - makedirs: True
    - require:
      - /home/{{ grains['BI_USER_NAME'] }}/go/src